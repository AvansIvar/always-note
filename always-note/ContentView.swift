//
//  ContentView.swift
//  always-note
//
//  Created by Ivar Schreutelkamp on 25/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var editor = EditorViewModel()

    var body: some View {
        VStack {
            HeaderView(
                decreaseFontSize: editor.decreaseFontSize,
                increaseFontSize: editor.increaseFontSize)
            EditorView(editor: editor)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
