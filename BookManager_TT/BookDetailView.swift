//
//  BookDetailView.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

import SwiftUI

struct BookDetailView: View {
    
    @Binding var book: Book
    @State private var showEditBook = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HStack(alignment: .top, spacing: 16) {
                    Image(book.cover)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 92, height: 140)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(book.title)
                            .font(.title3.weight(.semibold))
                            .multilineTextAlignment(.leading)
                        Text("by: \(book.author)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Text(book.summary)
                    .font(.body)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("My review")
                        .font(.title3)
                    
                    if !book.review.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        Text(book.review)
                            .font(.body)
                    }
                    
                    StarRatingView(rating: book.rating)
                }
            }
            .padding()
        }
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {
                    showEditBook = true
                }
            }
        }
        .sheet(isPresented: $showEditBook) {
            AddEditView(book: $book)
        }
    }
}
