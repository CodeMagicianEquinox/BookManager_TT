//
//  AddEditViewModel.swift
//  BookManager_TT
//
//  Created by Codex on 4/21/26.
//

import Foundation
import Observation
import SwiftData

@MainActor
@Observable
final class AddEditViewModel {
    let book: PersistentBook?
    let modelContext: ModelContext

    var title: String
    var author: String
    var summary: String
    var genre: BookGenre
    var status: ReadingStatus
    var cover: String
    var rating: Int
    var isFavorite: Bool
    var review: String
    var selectedImageData: Data?

    init(book: PersistentBook? = nil, modelContext: ModelContext) {
        self.book = book
        self.modelContext = modelContext
        self.title = book?.title ?? ""
        self.author = book?.author ?? ""
        self.summary = book?.summary ?? ""
        self.genre = book?.genre ?? .fantasy
        self.status = book?.status ?? .wantToRead
        self.cover = book?.cover ?? "lotr_fellowship"
        self.rating = book?.rating ?? 0
        self.isFavorite = book?.isFavorite ?? false
        self.review = book?.review ?? ""
        self.selectedImageData = book?.imageData
    }

    var navigationTitle: String {
        book == nil ? "Add Book" : "Edit Book"
    }

    var isSaveButtonDisabled: Bool {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return true }

        guard let book else { return false }

        return trimmedTitle == book.title
            && author == book.author
            && summary == book.summary
            && genre == book.genre
            && status == book.status
            && cover == book.cover
            && rating == book.rating
            && isFavorite == book.isFavorite
            && review == book.review
            && selectedImageData == book.imageData
    }

    func saveBook() throws {
        let targetBook = book ?? PersistentBook(
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
        targetBook.imageData = selectedImageData

        if book == nil {
            modelContext.insert(targetBook)
        }

        try modelContext.save()
    }
}
