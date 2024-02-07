//
//  NiceText+ViewModifier.swift
//  NiceComponents
//
//  Created by Brendan on 2024-01-29.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import SwiftUI

/// A view modifier for applying a specific text style to a view.
struct NiceTextModifier: ViewModifier {
    /// The text style to apply.
    let style: NiceTextStyle

    /// Applies the specified text style to the content view.
    /// - Parameter content: The content view to modify.
    /// - Returns: A modified view with the specified text style.
    func body(content: Content) -> some View {
        content
            .foregroundStyle(style.color)
            .scaledFont(
                name: style.font,
                size: style.size,
                weight: style.weight,
                maxSize: style.dynamicTypeMaxSize
            )
            .fixedSize(horizontal: false, vertical: true)
    }
}

public extension View {
    /// Applies the specified text style to the view.
    /// - Parameter style: The text style to apply.
    /// - Returns: A modified view with the specified text style.
    func niceText(_ style: NiceTextStyle) -> some View {
        modifier(NiceTextModifier(style: style))
    }
}
