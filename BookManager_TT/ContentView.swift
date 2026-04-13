//
//  ContentView.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var books = getBooks()
    @State private var showAddBook: Bool = false
    @State private var showFilters: Bool = false
    @State private var activeFilters = BookFilters()
    @State private var draftFilters = BookFilters()
    @State private var listSettings = ListSettings()
    @State private var newBook = Book(
        title: "",
        author: "",
        summary: "",
        cover: "lotr_fellowship",
        review: "",
        rating: 0,
        isFavorite: false,
        genre: .fantasy,
        status: .wantToRead
    )

    private var filteredBooks: [Book] {
        books.filter { book in
            let genreMatches = activeFilters.genre == .all || book.genre == activeFilters.genre
            let statusMatches = activeFilters.status == .all || book.status == activeFilters.status
            return genreMatches && statusMatches
        }
    }

    private func binding(for book: Book) -> Binding<Book>? {
        guard let index = books.firstIndex(where: { $0.id == book.id }) else {
            return nil
        }

        return $books[index]
    }
    
    var body: some View {
        TabView {
            NavigationStack {
                Group {
                    if filteredBooks.isEmpty {
                        ContentUnavailableView(
                            "No Books Match These Filters",
                            systemImage: "books.vertical",
                            description: Text("Try changing the genre or status filters.")
                        )
                    } else {
                        List {
                            ForEach(filteredBooks) { book in
                                if let bookBinding = binding(for: book) {
                                    NavigationLink(destination: BookDetailView(book: bookBinding)) {
                                        BookListItem(book: book, settings: listSettings)
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Book Manager")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button {
                            draftFilters = activeFilters
                            showFilters = true
                        } label: {
                            Image(systemName: activeFilters.hasActiveFilters ? "line.3.horizontal.decrease.circle.fill" : "line.3.horizontal.decrease.circle")
                        }

                        Button("Add Book") {
                            showAddBook.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showAddBook) {
                    if !newBook.title.isEmpty {
                        books.append(newBook)
                    }
                    newBook = Book(
                        title: "",
                        author: "",
                        summary: "",
                        cover: "lotr_fellowship",
                        review: "",
                        rating: 0,
                        isFavorite: false,
                        genre: .fantasy,
                        status: .wantToRead
                    )
                } content: {
                    AddEditView(book: $newBook)
                }
                .sheet(isPresented: $showFilters) {
                    FilterView(filters: $draftFilters) {
                        activeFilters = draftFilters
                    }
                }
            }
            .tabItem {
                Label("Books", systemImage: "books.vertical.fill")
            }

            FavoriteView(books: $books)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }

            SettingsView(listSettings: $listSettings)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
