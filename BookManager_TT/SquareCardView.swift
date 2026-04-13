//
//  SquareCardView.swift
//  BookManager_TT
//
//  Created by Codex on 4/12/26.
//

import SwiftUI

struct SquareCardView: View {
    var book: Book

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack(alignment: .topTrailing) {
                Image(book.cover)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 160)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                if book.isFavorite {
                    Image(systemName: "heart.fill")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(.red)
                        .clipShape(Circle())
                        .padding(10)
                }
            }

            Text(book.title)
                .font(.headline)
                .lineLimit(2)

            Text(book.author)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(1)

            StarRatingView(rating: book.rating)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(18)
        .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    SquareCardView(
        book: Book(
            title: "The Fellowship of the Ring",
            author: "J.R.R. Tolkien",
            summary: "A sample summary.",
            cover: "lotr_fellowship",
            review: "Loved it.",
            rating: 4,
            isFavorite: true
        )
    )
    .padding()
    .background(Color(.systemGroupedBackground))
}
