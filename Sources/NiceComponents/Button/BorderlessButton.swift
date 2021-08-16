//
//  BorderlessButton.swift
//  
//
//  Created by Brendan on 2021-07-13.
//

import SwiftUI

public struct BorderlessButton: View {
    let text: String
    let style: ButtonStyle
    let onClick: () -> Void

    public init(_ text: String, style: ButtonStyle? = nil, onClick: @escaping () -> Void) {
        self.text = text
        self.style = style ?? Config.current.borderlessButtonStyle
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
        .padding(Layout.Spacing.standard)
    }
}