//
//  AddEditView.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/25/26.
//

import PhotosUI
import SwiftData
import SwiftUI

struct AddEditView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    let book: Book?

    @State private var title: String
    @State private var author: String
    @State private var summary: String
    @State private var genre: BookGenre
    @State private var status: ReadingStatus
    @State private var cover: String
    @State private var rating: Int
    @State private var isFavorite: Bool
    @State private var review: String
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedImageData: Data?

    init(book: Book? = nil) {
        self.book = book
        _title = State(initialValue: book?.title ?? "")
        _author = State(initialValue: book?.author ?? "")
        _summary = State(initialValue: book?.summary ?? "")
        _genre = State(initialValue: book?.genre ?? .fantasy)
        _status = State(initialValue: book?.status ?? .wantToRead)
        _cover = State(initialValue: book?.cover ?? "lotr_fellowship")
        _rating = State(initialValue: book?.rating ?? 0)
        _isFavorite = State(initialValue: book?.isFavorite ?? false)
        _review = State(initialValue: book?.review ?? "")
        _selectedImageData = State(initialValue: book?.uploadedImage?.imageData)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Book details") {
                    TextField("Title of the book", text: $title)
                    TextField("Author", text: $author)
                    TextEditor(text: $summary)
                        .frame(height: 150)
                    Picker("Genre", selection: $genre) {
                        ForEach(BookGenre.allCases.filter { $0 != .all }) { genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                    Picker("Status", selection: $status) {
                        ForEach(ReadingStatus.allCases.filter { $0 != .all }) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    Picker("Cover", selection: $cover) {
                        Text("The Fellowship of the Ring").tag("lotr_fellowship")
                        Text("The Two Towers").tag("lotr_towers")
                        Text("The Return of the King").tag("lotr_king")
                    }

                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        Label(selectedImageData == nil ? "Upload cover image" : "Replace cover image", systemImage: "photo")
                    }

                    if let selectedImageData, let uiImage = UIImage(data: selectedImageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 160)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }

                Section("My review") {
                    Picker("Rating", selection: $rating) {
                        ForEach(0..<6, id: \.self) { num in
                            Text("\(num)").tag(num)
                        }
                    }
                    Toggle("Favorite", isOn: $isFavorite)
                    TextEditor(text: $review)
                        .frame(height: 150)
                }
            }
            .navigationTitle(book == nil ? "Add book" : "Edit book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveBook()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
            .task(id: selectedPhoto) {
                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                    selectedImageData = data
                }
            }
        }
    }

    private func saveBook() {
        let targetBook = book ?? Book(
            title: title,
            author: author,
            summary: summary,
            cover: cover,
            review: review,
            rating: rating,
            isFavorite: isFavorite,
            genre: genre,
            status: status
        )

        targetBook.title = title
        targetBook.author = author
        targetBook.summary = summary
        targetBook.cover = cover
        targetBook.review = review
        targetBook.rating = rating
        targetBook.isFavorite = isFavorite
        targetBook.genre = genre
        targetBook.status = status

        if let selectedImageData {
            if let uploadedImage = targetBook.uploadedImage {
                uploadedImage.imageData = selectedImageData
            } else {
                targetBook.uploadedImage = UploadedImage(imageData: selectedImageData)
            }
        }

        if book == nil {
            modelContext.insert(targetBook)
        }

        try? modelContext.save()
        dismiss()
    }
}

#Preview {
    AddEditView(
        book: Book(
            title: "The fellowship of the ring",
            author: "J.R.R. Tolkien",
            summary: "A sample summary.",
            cover: "lotr_fellowship",
            review: "Loved the pacing and world-building.",
            rating: 4,
            isFavorite: true,
            genre: .fantasy,
            status: .finished
        )
    )
    .modelContainer(for: [Book.self, UploadedImage.self], inMemory: true)
}
