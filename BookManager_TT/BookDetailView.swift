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
        VStack(alignment: .leading, spacing: 24) {
            Text("Details for:")
                .font(.headline)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .center)
            
            HStack {
                Image(book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 160)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(book.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("by \(book.author)")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                    
                    if !book.series.isEmpty {
                        Text(book.series)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    if let year = book.year {
                        Text("Published: \(year)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
            }
            
            Text(book.summary)
                .font(.body)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}
