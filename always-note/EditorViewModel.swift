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
    }

    func decreaseFontSize() {
        fontSize = max(fontSize - 1, 8)
    }

    func increaseFontSize() {
        fontSize += 1
    }
}
