//
//  HeaderView.swift
//  always-note
//
//  Created by Ivar Schreutelkamp on 25/02/2025.
//

import SwiftUI

struct HeaderView: View {
    var decreaseFontSize: () -> Void
    var increaseFontSize: () -> Void

    var body: some View {
        VStack {
            TitleView()
            HStack {
                ButtonView(title: "Decrease", action: decreaseFontSize)
                ButtonView(title: "Increase", action: increaseFontSize)
            }
        }
        .padding()
    }
}

#Preview {
    HeaderView(decreaseFontSize: {}, increaseFontSize: {})
}
