//
//  BookManager_TTUITests.swift
//  BookManager_TTUITests
//
//  Created by Timothy Terrance on 3/21/26.
//

import XCTest

final class BookManager_TTUITests: XCTestCase {

    override func setUpWithError() throws {
      
        continueAfterFailure = false

     
    }

    override func tearDownWithError() throws {
      
    }

    @MainActor
    func testExample() throws {
       
        let app = XCUIApplication()
        app.launch()

       
    }

}
