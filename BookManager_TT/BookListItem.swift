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
        HStack {
            Image(book.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 80)
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                Text("by \(book.author)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                StarRatingView(rating: book.rating)
            }
        }
    }
}
