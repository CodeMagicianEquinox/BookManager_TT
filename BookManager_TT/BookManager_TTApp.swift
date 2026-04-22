//
//  BookManager_TTApp.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

import SwiftUI
import SwiftData

@main
struct BookManager_TTApp: App {
    private let isUITesting = ProcessInfo.processInfo.arguments.contains("-uiTesting")

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Book.self, UploadedImage.self], inMemory: isUITesting)
    }
}
