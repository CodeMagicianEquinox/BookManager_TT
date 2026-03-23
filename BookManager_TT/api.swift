//
//  api.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

func getBooks() -> [Book] {
    return [
        Book(
            title: "The Fellowship of the Ring",
            author: "J.R.R. Tolkien",
            summary: "The first book in J.R.R. Tolkien's high-fantasy trilogy. Frodo Baggins begins his journey to destroy the One Ring.",
            cover: "lotr_fellowship",
            year: 1954,
            series: "The Lord of the Rings"
        ),
        Book(
            title: "The Two Towers",
            author: "J.R.R. Tolkien",
            summary: "The second book in the trilogy follows the divided fellowship as war spreads across Middle-earth.",
            cover: "lotr_towers",
            year: 1954,
            series: "The Lord of the Rings"
        ),
        Book(
            title: "The Return of the King",
            author: "J.R.R. Tolkien",
            summary: "The final book brings the story to its climax as the fate of Middle-earth is decided.",
            cover: "lotr_king",
            year: 1955,
            series: "The Lord of the Rings"
        ),
    ]
}
