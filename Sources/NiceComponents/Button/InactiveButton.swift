//
//  File.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct InactiveButton: View {
    let text: String
    let theme: ButtonTheme
    let onClick: () -> Void

    public init(_ text: String, theme: ButtonTheme? = nil, onClick: @escaping () -> Void) {
        self.text = text
        self.theme = theme ?? Config.current.inactiveButton
        self.onClick = onClick
    }

    public var body: some View {
        Button(action: onClick) {
            Text(text)
                .foregroundColor(theme.textTheme.color)
                .font(Config.current.textFont(size: theme.textTheme.size))
                .lineLimit(1)
                .frame(maxWidth: .infinity, minHeight: theme.height, maxHeight: theme.height)
        }
        .fixedSize(horizontal: false, vertical: true)
        .background(theme.color)
        .cornerRadius(theme.borderRadius)
        .overlay(
            RoundedRectangle(cornerRadius: theme.borderRadius)
                .stroke(theme.borderColor, lineWidth: 2)
        ).padding(Layout.Padding.standard)
    }
}
