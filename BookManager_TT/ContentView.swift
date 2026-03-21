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
        Book(title: "Book 1", author: "Jorge"),
        Book(title: "Book 2", author: "Jeff"),
        Book(title: "Book 3", author: "Ashley"),
        Book(title: "Book 4", author: "Tim")
    ]
    
    var body: some View {
        List(books) { book in
            BookListItem(book: book)
        }
        
    }
}
#Preview {
    ContentView()
}
