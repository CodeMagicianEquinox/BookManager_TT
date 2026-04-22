//
//  BookManager_TTTests.swift
//  BookManager_TTTests
//
//  Created by Timothy Terrance on 3/21/26.
//

import SwiftData
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

@MainActor @Suite("Favorite View tests")
struct FavoriteViewTests {

    @Test("Filter function works correctly")
    func testFilterFunctionWorksCorrectly() {
        // Arrange
        let books = [
            PersistentBook(title: "Book1", isFavorite: true),
            PersistentBook(title: "Book2"),
            PersistentBook(title: "Book3"),
        ]

        // Act
        let favoriteBooks = filterFavoriteBooks(
            books: books,
            selectedGenre: nil,
            selectedStatus: nil
        )

        // Assert
        #expect(favoriteBooks.count == 1)
        #expect(favoriteBooks[0].title == "Book1")
    }
}

@MainActor
struct AddEditViewModelTests {

    @Test("ViewModel initializes correctly for a new book")
    func testNewBookInitialization() throws {
        // phase 1: Arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            UploadedImage.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext

        // phase 2: Act
        let viewModel = AddEditViewModel(modelContext: modelContext)

        // phase 3: Assert
        #expect(viewModel.title == "")
        #expect(viewModel.author == "")
        #expect(viewModel.summary == "")
        #expect(viewModel.genre == .fantasy)
        #expect(viewModel.status == .wantToRead)
        #expect(viewModel.cover == "lotr_fellowship")
        #expect(viewModel.rating == 0)
        #expect(viewModel.isFavorite == false)
        #expect(viewModel.review == "")
        #expect(viewModel.selectedImageData == nil)
        #expect(viewModel.navigationTitle == "Add Book")
        #expect(viewModel.isSaveButtonDisabled)
    }

    @Test("ViewModel initializes correctly for an existing book")
    func testExistingBookInitialization() throws {
        // phase 1: Arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            UploadedImage.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        let book = PersistentBook(title: "Test Book", author: "Test Author", genre: .fantasy)

        // phase 2: Act
        let viewModel = AddEditViewModel(book: book, modelContext: modelContext)

        // phase 3: Assert
        #expect(viewModel.title == "Test Book")
        #expect(viewModel.author == "Test Author")
        #expect(viewModel.summary == "")
        #expect(viewModel.genre == .fantasy)
        #expect(viewModel.status == .wantToRead)
        #expect(viewModel.cover == "lotr_fellowship")
        #expect(viewModel.rating == 0)
        #expect(viewModel.isFavorite == false)
        #expect(viewModel.review == "")
        #expect(viewModel.selectedImageData == nil)
        #expect(viewModel.navigationTitle == "Edit Book")
        #expect(viewModel.isSaveButtonDisabled)

        // Check small changes
        viewModel.title = " \n"
        #expect(viewModel.isSaveButtonDisabled)

        viewModel.title = "Test Book"
        #expect(viewModel.isSaveButtonDisabled)

        viewModel.title = "Test Book 2"
        #expect(!viewModel.isSaveButtonDisabled)
    }

    @Test("ViewModel creates a new book correctly")
    func testCreateNewBook() throws {

    }

    @Test("ViewModel updates an existing book correctly")
    func testUpdateExistingBook() throws {

    }
}
