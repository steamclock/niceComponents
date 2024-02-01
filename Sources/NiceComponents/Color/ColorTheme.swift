//
// ColorTheme.swift
//
//
//  Created by Brendan Lensink on 2024-01-29.
//

import SwiftUI

/// A collection of colors available to be used by developers, used across different components.
/// A color theme provides primitive values for the colors available to developers, abstracting away the need to keep track of actual color names and values.
/// The colors described here should be assigned a semantic meaning through assignment to a ColorStyle for use in components.
/// The language and structure used here is heavily influenced by the [Material Design color system](https://m2.material.io/design/color/the-color-system.html).
public protocol ColorTheme {
    /// The color most frequently displayed across components.
    var primary: Color { get }

    /// An optional variant, or shade, of your primary color.
    var primaryVariant: Color { get }

    /// The color elements presented on top of primary colors should use.
    var onPrimary: Color { get }

    /// An alternate theme color, complimentary to the primary color.
    var secondary: Color { get }

    /// An optional variant of the secondary theme color.
    var secondaryVariant: Color { get }

    /// The color elements presented on top of secondary colors should use.
    var onSecondary: Color { get }

    /// The color that should appear behind scrollable content within the app.
    var background: Color { get }

    /// The color elements presented on top of a background should use.
    var onBackground: Color { get }

    /// The color used to indicate errors in components.
    var error: Color { get }

    /// The color elements presented on top of errors should use.
    var onError: Color { get }

    /// The color used for background colors in components, such as sheets, cards and menus.
    var surface: Color { get }

    /// The color elements presented on top of a surfaces should use.
    var onSurface: Color { get }

    /// The color used for drop shadows.
    var shadow: Color { get }
}
