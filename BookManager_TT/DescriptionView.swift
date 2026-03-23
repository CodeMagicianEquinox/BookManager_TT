//
//  DescriptionView.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

import SwiftUI

struct DescriptionView: View {
    let itemName: String
    let book: Book
    
    var body: some View {
        BookDetailView(book: book)
            .navigationTitle(itemName)
            .navigationBarTitleDisplayMode(.inline)
    }
}
