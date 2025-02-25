//
//  EditorView.swift
//  always-note
//
//  Created by Ivar Schreutelkamp on 25/02/2025.
//

import SwiftUI

struct EditorView: View {
    @ObservedObject var editor: EditorViewModel

    var body: some View {
        VStack {
            TextEditor(text: $editor.noteContents)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .font(.system(size: editor.fontSize))
                .padding()
        }
    }
}

#Preview {
    EditorView(editor: EditorViewModel())
}
