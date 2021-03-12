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
    public var primary = Color("primary", bundle: Bundle.module)
    public var primaryVariant = Color("primaryVariant", bundle: Bundle.module)
    public var secondary = Color("secondary", bundle: Bundle.module)
    public var secondaryVariant = Color("secondaryVariant", bundle: Bundle.module)
    public var surface = Color("surface", bundle: Bundle.module)
    public var background = Color("background", bundle: Bundle.module)
    public var error = Color("error", bundle: Bundle.module)

    public var onPrimary = Color("onPrimary", bundle: Bundle.module)
    public var onSecondary = Color("onSecondary", bundle: Bundle.module)
    public var onBackground = Color("onBackground", bundle: Bundle.module)
    public var onSurface = Color("onSurface", bundle: Bundle.module)
    public var onError = Color("onError", bundle: Bundle.module)
}
