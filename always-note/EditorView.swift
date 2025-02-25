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
            
            Button("Save", action: {
                editor.save()
            })
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .alert(isPresented: $editor.showAlert) {
                Alert(title: Text("Saved"), message: Text("Your note has been saved"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    EditorView(editor: EditorViewModel())
}
