//
//  AddEditView.uitest.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 4/18/26.
//

import XCTest

final class AddEditViewUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testAddBookWorks() throws {
        let app = XCUIApplication()
        app.launchArguments.append("-uiTesting")
        app.launch()

        let addBookButton = app.buttons["Add"]
        XCTAssertTrue(addBookButton.waitForExistence(timeout: 5))

        let beforeAddingBookCount = app.cells.count

        addBookButton.tap()

        let newBookTitle = "New book \(beforeAddingBookCount)"
        let titleTextField = app.textFields["Title of the book"]
        let saveButton = app.buttons["Save"]

        XCTAssertTrue(titleTextField.waitForExistence(timeout: 5))
        XCTAssertTrue(saveButton.waitForExistence(timeout: 5))
        XCTAssertFalse(saveButton.isEnabled)

        titleTextField.tap()
        titleTextField.typeText(newBookTitle)

        XCTAssertTrue(saveButton.isEnabled)
        saveButton.tap()

        XCTAssertTrue(app.staticTexts[newBookTitle].waitForExistence(timeout: 5))

        let afterAddingBookCount = app.cells.count
        XCTAssertEqual(afterAddingBookCount, beforeAddingBookCount + 1)

        let lastBookCell = app.cells.element(boundBy: beforeAddingBookCount)
        XCTAssertTrue(lastBookCell.staticTexts[newBookTitle].exists)
    }
}
