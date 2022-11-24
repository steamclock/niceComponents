//
//  ColorTheme.swift
//  NiceComponents
//
//  Created by Brendan on 2021-02-05.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// A collection of styling settings for colors, used across components
/// The language and structure used here is heavily influenced by the [Material Design color system](https://m2.material.io/design/color/the-color-system.html).
public struct ColorTheme {
    /// The color most frequently displayed across components.
    public var primary: Color

    /// An optional variant, or shade, of your primary color.
    public var primaryVariant: Color

    /// The color elements presented on top of primary colors should use.
    public var onPrimary: Color

    /// An alternate theme color, complimentary to the primary color.
    public var secondary: Color

    /// An optional variant of the secondary theme color.
    public var secondaryVariant: Color

    /// The color elements presented on top of secondary colors should use.
    public var onSecondary: Color

    /// The color that should appear behind scrollable content within the app.
    public var background: Color

    /// The color elements presented on top of a background should use.
    public var onBackground: Color

    /// The color used to indicate errors in components.
    public var error: Color

    /// The color elements presented on top of errors should use.
    public var onError: Color

    /// The color used for background colors in components, such as sheets, cards and menus.
    public var surface: Color

    /// The color elements presented on top of a surfaces should use.
    public var onSurface: Color

    /// The color used for drop shadows.
    public var shadow: Color

    /**
     * Create a new color theme.
     * By default, any color omitted here will user the corresponding color in Colors.xcassets
     *
     * - Parameters:
     *  - primary: The color most frequently displayed across components.
     *  - primaryVariant: An optional variant, or shade, of your primary color.
     *  - onPrimary: The color elements presented on top of primary colors should use.
     *  - secondary: An alternate theme color, complimentary to the primary color.
     *  - secondaryVariant: An optional variant of the secondary theme color.
     *  - onSecondary: The color elements presented on top of secondary colors should use.
     *  - background: The color that should appear behind scrollable content within the app.
     *  - onBackground: The color elements presented on top of a background should use.
     *  - error: The color used to indicate errors in components.
     *  - onError: The color elements presented on top of errors should use.
     *  - surface: The color used for background colors in components, such as sheets, cards and menus.
     *  - onSurface: The color elements presented on top of a surfaces should use.
     *  - shadow: The color used for drop shadows.
     */
    public init(
        primary: Color? = nil,
        primaryVariant: Color? = nil,
        onPrimary: Color? = nil,
        secondary: Color? = nil,
        secondaryVariant: Color? = nil,
        onSecondary: Color? = nil,
        background: Color? = nil,
        onBackground: Color? = nil,
        error: Color? = nil,
        onError: Color? = nil,
        surface: Color? = nil,
        onSurface: Color? = nil,
        shadow: Color? = nil
    ) {
        self.primary = primary ?? Color("primary", bundle: Bundle.module)
        self.primaryVariant = primaryVariant ?? Color("primaryVariant", bundle: Bundle.module)
        self.onPrimary = onPrimary ?? Color("onPrimary", bundle: Bundle.module)

        self.secondary = secondary ?? Color("secondary", bundle: Bundle.module)
        self.secondaryVariant = secondaryVariant ?? Color("secondaryVariant", bundle: Bundle.module)
        self.onSecondary = onSecondary ?? Color("onSecondary", bundle: Bundle.module)

        self.background = background ?? Color("background", bundle: Bundle.module)
        self.onBackground = onBackground ?? Color("onBackground", bundle: Bundle.module)

        self.error = error ?? Color("error", bundle: Bundle.module)
        self.onError = onError ?? Color("onError", bundle: Bundle.module)

        self.surface = surface ?? Color("surface", bundle: Bundle.module)
        self.onSurface = onSurface ?? Color("onSurface", bundle: Bundle.module)

        self.shadow = shadow ?? Color("onSurface", bundle: Bundle.module)
    }
}
