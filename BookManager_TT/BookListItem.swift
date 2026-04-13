//
//  BookListItem.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

import SwiftUI

struct BookListItem: View {
    var book: Book
    var settings: ListSettings
    
    var body: some View {
        HStack {
            ZStack(alignment: .topTrailing) {
                Image(book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 80)

                if book.isFavorite {
                    Image(systemName: "heart.fill")
                        .font(.caption)
                        .foregroundStyle(.white)
                        .padding(6)
                        .background(.red)
                        .clipShape(Circle())
                        .offset(x: 8, y: -8)
                }
            }
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                Text("by \(book.author)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                if settings.showGenreAndStatus {
                    Text("\(book.genre.rawValue) • \(book.status.rawValue)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                if settings.showRatings {
                    StarRatingView(rating: book.rating)
                }
            }
        }
    }
}
