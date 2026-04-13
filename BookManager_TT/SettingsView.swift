//
//  SettingsView.swift
//  BookManager_TT
//
//  Created by Timothy Terrance on 4/12/26.
//

import SwiftUI

struct SettingsView: View {
    @Binding var listSettings: ListSettings

    var body: some View {
        NavigationStack {
            Form {
                Section("List settings") {
                    Toggle("Show ratings", isOn: $listSettings.showRatings)
                    Toggle("Show genre and status", isOn: $listSettings.showGenreAndStatus)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(listSettings: .constant(ListSettings()))
}
