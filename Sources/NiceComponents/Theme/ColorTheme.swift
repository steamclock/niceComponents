//
//  Colors.swift
//
//
//  Created by Brendan on 2021-02-05.
//

import SwiftUI

// TODO: Figure out how to support light/dark colors.
// TODO: is there a better way to pair the color/onColors?
public struct ColorTheme {
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

    public init(primary: Color? = nil,
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
            onSurface: Color? = nil) {
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
    }
}
