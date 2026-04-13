//
//  FilterView.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 4/12/26.
//

import SwiftUI

struct FilterView: View {
    @Binding var filters: BookFilters

    @Environment(\.dismiss) private var dismiss

    var onApply: () -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section("Filter by Genre") {
                    Picker("Genre", selection: $filters.genre) {
                        ForEach(BookGenre.allCases) { genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                    .pickerStyle(.menu)
                }

                Section("Filter by Status") {
                    Picker("Status", selection: $filters.status) {
                        ForEach(ReadingStatus.allCases) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle("Filter Options")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Apply") {
                        onApply()
                        dismiss()
                    }
                }

                ToolbarItem(placement: .bottomBar) {
                    Button("Clear Filters") {
                        filters = BookFilters()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

#Preview {
    FilterView(filters: .constant(BookFilters())) { }
}
