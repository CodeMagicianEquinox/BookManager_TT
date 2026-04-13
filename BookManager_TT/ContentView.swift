//
//  ContentView.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Book.title) private var books: [Book]

    @State private var showAddBook = false
    @State private var showFilters = false
    @State private var activeFilters = BookFilters()
    @State private var draftFilters = BookFilters()
    @State private var listSettings = ListSettings()

    private var filteredBooks: [Book] {
        books.filter { book in
            let genreMatches = activeFilters.genre == .all || book.genre == activeFilters.genre
            let statusMatches = activeFilters.status == .all || book.status == activeFilters.status
            return genreMatches && statusMatches
        }
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
                                NavigationLink(destination: BookDetailView(book: book)) {
                                    BookListItem(book: book, settings: listSettings)
                                }
                            }
                            .onDelete(perform: deleteBooks)
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
                            showAddBook = true
                        }
                    }
                }
                .sheet(isPresented: $showAddBook) {
                    AddEditView()
                }
                .sheet(isPresented: $showFilters) {
                    FilterView(filters: $draftFilters) {
                        activeFilters = draftFilters
                    }
                }
                .task {
                    seedBooksIfNeeded()
                }
            }
            .tabItem {
                Label("Books", systemImage: "books.vertical.fill")
            }

            FavoriteView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }

            SettingsView(listSettings: $listSettings)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }

    private func deleteBooks(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(filteredBooks[index])
        }

        try? modelContext.save()
    }

    private func seedBooksIfNeeded() {
        let descriptor = FetchDescriptor<Book>()
        guard (try? modelContext.fetchCount(descriptor)) == 0 else { return }

        for book in getBooks() {
            modelContext.insert(book)
        }

        try? modelContext.save()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Book.self, UploadedImage.self], inMemory: true)
}
