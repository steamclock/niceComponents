//
//  ColorTheme.swift
//  NiceComponents
//
//  Created by Brendan on 2021-02-05.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI
import NiceInit

/// A collection of styling settings for colors, used across components
/// The language and structure used here is heavily influenced by the [Material Design color system](https://m2.material.io/design/color/the-color-system.html).
@NiceInit public struct ColorTheme {
    /// The color most frequently displayed across components.
    @Asset public var primary: Color

    /// An optional variant, or shade, of your primary color.
    @Asset public var primaryVariant: Color

    /// The color elements presented on top of primary colors should use.
    @Asset public var onPrimary: Color

    /// An alternate theme color, complimentary to the primary color.
    @Asset public var secondary: Color

    /// An optional variant of the secondary theme color.
    @Asset public var secondaryVariant: Color

    /// The color elements presented on top of secondary colors should use.
    @Asset public var onSecondary: Color

    /// The color that should appear behind scrollable content within the app.
    @Asset public var background: Color

    /// The color elements presented on top of a background should use.
    @Asset public var onBackground: Color

    /// The color used to indicate errors in components.
    @Asset public var error: Color

    /// The color elements presented on top of errors should use.
    @Asset public var onError: Color

    /// The color used for background colors in components, such as sheets, cards and menus.
    @Asset public var surface: Color

    /// The color elements presented on top of a surfaces should use.
    @Asset public var onSurface: Color

    /// The color used for drop shadows.
    @Asset public var shadow: Color

}
