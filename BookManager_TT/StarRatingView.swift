//
//  StarRatingView.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/25/26.
//

import SwiftUI

struct StarRatingView: View {
    var rating: Int
    
    var body: some View {
        
        HStack(spacing: 10)
        {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
    }
}
