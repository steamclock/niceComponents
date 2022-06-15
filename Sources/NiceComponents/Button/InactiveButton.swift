//
//  File.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct InactiveButton: View {
    let text: String
    let style: ButtonStyle

    public init(_ text: String, style: ButtonStyle? = nil) {
        self.text = text
        self.style = style ?? Config.current.inactiveButtonStyle
    }

    public var body: some View {
        Button(action: {}) {
            Text(text)
                .foregroundColor(style.onSurfaceColor)
                .scaledFont(name: style.textStyle.name, size: style.textStyle.size, weight: style.textStyle.weight)
                .frame(maxWidth: .infinity, minHeight: style.height, maxHeight: style.height)
        }
        .disabled(true)
        .fixedSize(horizontal: false, vertical: true)
        .background(style.surfaceColor)
        .cornerRadius(style.border.radius)
        .overlay(
            RoundedRectangle(cornerRadius: style.border.radius)
                .stroke(style.border.color, lineWidth: style.border.width)
        )
    }
}
