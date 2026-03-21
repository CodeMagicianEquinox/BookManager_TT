//
//  ContentView.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    private let books: [Book] = [
        Book(title: "Book 1", author: "Jorge", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
        Book(title: "Book 2", author: "Jeff", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
        Book(title: "Book 3", author: "Ashley", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
        Book(title: "Book 4", author: "Tim", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
    ]
    
    var body: some View {
        NavigationStack{
            List(books) { book in
                NavigationLink(destination: BookDetailView(book: book)){
                    BookListItem(book: book)
                }
            }
        }
    }
}
#Preview {
    ContentView()
}

