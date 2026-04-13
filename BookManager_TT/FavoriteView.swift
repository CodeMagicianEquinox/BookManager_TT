//
//  FavoriteView.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 4/12/26.
//

import SwiftData
import SwiftUI

struct FavoriteView: View {
    @Query(sort: \Book.title) private var books: [Book]

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    private var favoriteBooks: [Book] {
        books.filter(\.isFavorite)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                if favoriteBooks.isEmpty {
                    ContentUnavailableView(
                        "No Favorite Books Yet",
                        systemImage: "heart.slash",
                        description: Text("Mark a book as a favorite to see it here.")
                    )
                    .padding(.top, 80)
                } else {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(favoriteBooks) { book in
                            SquareCardView(book: book)
                        }
                    }
                    .padding()
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Favorite Books")
        }
    }
}

#Preview {
    FavoriteView()
        .modelContainer(for: [Book.self, UploadedImage.self], inMemory: true)
}
