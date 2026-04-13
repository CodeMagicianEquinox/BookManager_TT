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
    @State private var newBook = Book(
        title: "",
        author: "",
        summary: "",
        cover: "lotr_fellowship",
        review: "",
        rating: 0,
        isFavorite: false
    )
    
    var body: some View {
        TabView {
            NavigationStack {
                List($books) { book in
                    NavigationLink(destination: BookDetailView(book: book)) {
                        BookListItem(book: book.wrappedValue)
                    }
                }
                .navigationTitle("Book Manager")
                .navigationBarItems(trailing: Button("Add Book") {
                    showAddBook.toggle()
                })
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
                        isFavorite: false
                    )
                } content: {
                    AddEditView(book: $newBook)
                }
            }
            .tabItem {
                Label("Books", systemImage: "books.vertical.fill")
            }

            FavoriteView(books: $books)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
