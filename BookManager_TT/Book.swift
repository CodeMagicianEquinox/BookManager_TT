//
//  Book.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

import Foundation
import SwiftData
import SwiftUI

enum BookGenre: String, CaseIterable, Identifiable, Codable {
    case all = "All"
    case fantasy = "Fantasy"
    case adventure = "Adventure"
    case classic = "Classic"

    var id: String { rawValue }
}

enum ReadingStatus: String, CaseIterable, Identifiable, Codable {
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

@Model
final class UploadedImage {
    @Attribute(.externalStorage) var imageData: Data

    init(imageData: Data) {
        self.imageData = imageData
    }
}

@Model
final class Book {
    var title: String
    var author: String
    var summary: String
    var cover: String
    var review: String
    var rating: Int
    var isFavorite: Bool
    var genreRawValue: String
    var statusRawValue: String
    @Relationship(deleteRule: .cascade) var uploadedImage: UploadedImage?

    var genre: BookGenre {
        get { BookGenre(rawValue: genreRawValue) ?? .fantasy }
        set { genreRawValue = newValue.rawValue }
    }

    var status: ReadingStatus {
        get { ReadingStatus(rawValue: statusRawValue) ?? .wantToRead }
        set { statusRawValue = newValue.rawValue }
    }

    init(
        title: String,
        author: String,
        summary: String,
        cover: String = "lotr_fellowship",
        review: String,
        rating: Int,
        isFavorite: Bool = false,
        genre: BookGenre = .fantasy,
        status: ReadingStatus = .wantToRead,
        uploadedImage: UploadedImage? = nil
    ) {
        self.title = title
        self.author = author
        self.summary = summary
        self.cover = cover
        self.review = review
        self.rating = rating
        self.isFavorite = isFavorite
        self.genreRawValue = genre.rawValue
        self.statusRawValue = status.rawValue
        self.uploadedImage = uploadedImage
    }

    var imageData: Data? {
        get { uploadedImage?.imageData }
        set {
            guard let newValue else {
                uploadedImage = nil
                return
            }

            if let uploadedImage {
                uploadedImage.imageData = newValue
            } else {
                uploadedImage = UploadedImage(imageData: newValue)
            }
        }
    }

    @Transient
    var displayImage: Image {
        if let imageData, let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)
        }

        return Image(cover)
    }
}
