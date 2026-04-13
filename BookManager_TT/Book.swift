//
//  Book.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

import Foundation

enum BookGenre: String, CaseIterable, Identifiable {
    case all = "All"
    case fantasy = "Fantasy"
    case adventure = "Adventure"
    case classic = "Classic"

    var id: String { rawValue }
}

enum ReadingStatus: String, CaseIterable, Identifiable {
    case all = "All"
    case wantToRead = "Want to Read"
    case reading = "Reading"
    case finished = "Finished"

    var id: String { rawValue }
}

struct BookFilters {
    var genre: BookGenre = .all
    var status: ReadingStatus = .all

    var hasActiveFilters: Bool {
        genre != .all || status != .all
    }
}

struct ListSettings {
    var showRatings: Bool = true
    var showGenreAndStatus: Bool = true
}

struct Book: Identifiable {
    let id: UUID = UUID()
    var title: String
    var author: String
    var summary: String
    var cover: String
    var review: String
    var rating: Int
    var isFavorite: Bool = false
    var genre: BookGenre = .fantasy
    var status: ReadingStatus = .wantToRead
}
