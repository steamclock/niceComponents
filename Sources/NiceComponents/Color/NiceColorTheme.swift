//
//  NiceColorTheme.swift
//  NiceComponents
//
//  Created by Brendan on 2021-02-05.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// A nice default color theme. If you don't set a color style, we'll use this instead.
public struct NiceColorTheme: ColorTheme {
    public var primary: Color

    public var primaryVariant: Color

    public var onPrimary: Color

    public var secondary: Color

    public var secondaryVariant: Color

    public var onSecondary: Color

    public var background: Color

    public var onBackground: Color

    public var error: Color

    public var onError: Color

    public var surface: Color

    public var onSurface: Color

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

public extension NiceColorTheme {
    func with(
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
    ) -> NiceColorTheme {
        NiceColorTheme(
            primary: primary,
            primaryVariant: primaryVariant,
            onPrimary: onPrimary,
            secondary: secondary,
            secondaryVariant: secondaryVariant,
            onSecondary: onSecondary,
            background: background,
            onBackground: onBackground,
            error: error,
            onError: onError,
            surface: surface,
            onSurface: onSurface,
            shadow: shadow
        )
    }
}
