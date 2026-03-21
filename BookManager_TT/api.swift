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
            summary: "A young hobbit, Frodo Baggins, sets out on a perilous journey to destroy the One Ring and save Middle-earth.",
            cover: "lotr_fellowship"
        ),
        Book(
            title: "Book 2",
            author: "Jeff",
            summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            cover: "lotr_king"
        ),
        Book(
            title: "Book 3",
            author: "Ashley",
            summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            cover: "lotr_towers"
        ),
        Book(
            title: "Book 4",
            author: "Tim",
            summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            cover: "lotr_king"
        )
    ]
}
