//
//  Book.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

import Foundation

struct Book: Identifiable {
    let id: UUID = UUID()
    var title: String
    var author: String
    var summary: String = ""
    var cover: String = ""
    var year: Int? = nil
    var series: String = ""
}
