//
//  DestructiveButton.swift
//  
//
//  Created by Brendan on 2021-02-05.
//

import SwiftUI

public struct DestructiveButton: View {
    let text: String
    let style: ButtonStyle
    let onClick: () -> Void

    public init(_ text: String, style: ButtonStyle? = nil, onClick: @escaping () -> Void) {
        self.text = text
        self.style = style ?? Config.current.destructiveButtonStyle
        self.onClick = onClick
    }

    public var body: some View {
        Button(action: onClick) {
            Text(text)
                .foregroundColor(style.onSurfaceColor)
                .scaledFont(name: style.textStyle.name, size: style.textStyle.size, weight: style.textStyle.weight)
                .frame(maxWidth: .infinity, minHeight: style.height, maxHeight: style.height)
        }
        .fixedSize(horizontal: false, vertical: true)
        .background(style.surfaceColor)
        .cornerRadius(style.border.radius)
        .overlay(
            RoundedRectangle(cornerRadius: style.border.radius)
                .stroke(style.border.color, lineWidth: style.border.width)
        )
    }
}
