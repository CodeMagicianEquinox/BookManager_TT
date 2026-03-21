//
//  BookDetailView.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

import SwiftUI

struct BookDetailView: View {
    
    var book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(book.title)
                .font(.headline)
            Text("by \(book.author)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text(book.summary)
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}
