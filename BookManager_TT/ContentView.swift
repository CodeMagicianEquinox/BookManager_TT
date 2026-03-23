//
//  ContentView.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    private let books = getBooks()
    
    var body: some View {
        NavigationView {
            List(books) { book in
                NavigationLink(destination: DescriptionView(itemName: book.title, book: book)) {
                    BookListItem(book: book)
                }
            }
            .navigationTitle("LOTR Trilogy")
        }
    }
}
#Preview {
    ContentView()
}
