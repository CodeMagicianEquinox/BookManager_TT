//
//  BookListItem.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

import SwiftUI

struct BookListItem: View {
    var book: Book
    
    var body: some View {
        VStack{
            Text(book.title)
                .font(.headline)
            Text("by \(book.author)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        
    }
}
