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
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        if horizontalSizeClass == .compact {
            VStack {
                TitleView()
                HStack {
                    ButtonView(title: "Decrease", action: decreaseFontSize)
                    ButtonView(title: "Increase", action: increaseFontSize)
                }
            }
            .padding()
        } else {
            HStack {
                TitleView()

                ButtonView(title: "Decrease", action: decreaseFontSize)
                ButtonView(title: "Increase", action: increaseFontSize)
            }
            .padding()
        }
    }
}

#Preview {
    HeaderView(decreaseFontSize: {}, increaseFontSize: {})
}
