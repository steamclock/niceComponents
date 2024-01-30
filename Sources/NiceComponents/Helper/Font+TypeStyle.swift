//
//  Font+TypeStyle.swift
//  NiceComponents
//
//  Created by Alejandro Zielinsky on 2022-06-30.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

public extension Font {
    /**
     * Create a custom Font from a given FontStyle
     *
     * - Parameter fontStyle: The styling to use when creating a Font.
     */
    static func custom(_ fontTheme: FontTheme) -> Font {
        if let fontName = fontTheme.name {
            return .custom(fontName, size: fontTheme.size)
        } else {
            return .system(size: fontTheme.size, weight: fontTheme.weight ?? .regular)
        }
    }

    /**
     * Create a custom Font from a given NiceTextStyle
     *
     * - Parameter textStyle: The styling to use when creating a Font.
     */
    static func custom(_ textStyle: NiceTextStyle) -> Font {
        custom(textStyle.fontTheme)
    }
}
