//
//  EditorViewModel.swift
//  always-note
//
//  Created by Ivar Schreutelkamp on 25/02/2025.
//

import SwiftUI
import Combine

class EditorViewModel: ObservableObject {
    @Published var fontSize: CGFloat {
        didSet {
            UserDefaults.standard.set(fontSize, forKey: "fontSize")
        }
    }
    @Published var noteContents = ""

    init() {
        let savedFontSize = UserDefaults.standard.float(forKey: "fontSize")
        self.fontSize = savedFontSize > 0 ? CGFloat(savedFontSize) : 17
        load()
    }

    func decreaseFontSize() {
        fontSize = max(fontSize - 1, 8)
    }

    func increaseFontSize() {
        fontSize += 1
    }

    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func load() {
        let url = getDocumentDirectory().appendingPathComponent("note.txt")
        if let savedData = try? String(contentsOf: url, encoding: .utf8) {
            noteContents = savedData
        }
    }

    func save() {
        let url = getDocumentDirectory().appendingPathComponent("note.txt")
        do {
            try noteContents.write(to: url, atomically: true, encoding: .utf8)
            showAlert = true
        } catch {
            print("Failed to save note.")
        }
    }
    
    @Published var showAlert = false
}
