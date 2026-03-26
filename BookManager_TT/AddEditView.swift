//
//  AddEditView.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 3/25/26.
//

import SwiftUI

struct AddEditView: View {
    
    @Binding var book: Book
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Book details")){
                    TextField("Title of the book", text: $book.title)
                    TextField("Author", text: $book.author)
                    TextEditor(text: $book.summary)
                        .frame(height: 150)
                    Picker("Cover", selection: $book.cover){
                        Text("The Fellowship of the ring").tag("lotr_fellowship")
                        Text("The Two Towers").tag("lotr_towers")
                        Text("The Return of the King").tag("lotr_king")
                    }
                }
                
                Section(header: Text("My review")){
                    Picker("Rating", selection: $book.rating){
                        ForEach(1..<6, id: \.self) { num in
                            Text("\(num)").tag(num)
                        }
                    }
                    TextEditor(text: $book.review)
                        .frame(height:150)
                }
            }
            .navigationTitle("Add book")
            .navigationBarTitleDisplayMode( .inline )
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddEditView(
        book: .constant(
            Book(
                title: "The fellowship of the ring",
                author: "J.R.R. Tolkien",
                summary: "A sample summary.",
                cover: "lotr_fellowship",
                review: "Loved the pacing and world-building.",
                rating: 4
            )
        )
    )
}
