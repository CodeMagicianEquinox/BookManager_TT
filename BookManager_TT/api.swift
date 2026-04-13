//
//  api.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/21/26.
//

func getBooks() -> [Book] {
    return [
        Book(
            title: "The fellowship of the ring",
            author: "J.R.R. Tolkien",
            summary: "Fellowhip Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            cover: "lotr_fellowship",
            review: "",
            rating: 3,
            isFavorite: true
        ),
        Book(
            title: "The two towers",
            author: "J.R.R. Tolkien",
            summary: "Tower Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            cover: "lotr_towers",
            review: "",
            rating: 2,
            isFavorite: true
        ),
        Book(
            title: "The return of the king",
            author: "J.R.R. Tolkien",
            summary: "King Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            cover: "lotr_king",
            review: "",
            rating: 4,
            isFavorite: true
        )
    ]
}
