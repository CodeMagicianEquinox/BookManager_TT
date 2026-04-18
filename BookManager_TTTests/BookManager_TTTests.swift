//
//  BookManager_TTTests.swift
//  BookManager_TTTests
//
//  Created by Timothy Terrance on 3/21/26.
//

import Testing
@testable import BookManager_TT

@MainActor @Suite("Persistent Book tests")
struct PersistentBookTests {

    @Test("Persistent Book initializer")
    func testPersistentBookInitializer() {
        // Arrange
        let bookTitle = "Test Title"
        let status = ReadingStatus.reading
        let author = "Test Author"
        let isFavorite = true

        // Act
        let book = PersistentBook(title: bookTitle)

        // Assert
        #expect(book.title == bookTitle)
        #expect(book.status == .unknown)
        #expect(book.author == "")
        #expect(book.isFavorite == false)
        #expect(book.getNameAndAuthor() == "Test Title by Unknown Author")

        // Act II
        book.status = status
        book.author = author
        book.isFavorite = isFavorite

        // Assert II
        #expect(book.status == .reading)
        #expect(book.author == "Test Author")
        #expect(book.isFavorite == true)
        #expect(book.getNameAndAuthor() == "Test Title by Test Author")
    }
}
