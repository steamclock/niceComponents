//
//  Font+TypeStyle.swift
//  NiceComponents
//
//  Created by Alejandro Zielinsky on 2022-06-30.
//

import SwiftUI

public extension Font {
    /**
     * Create a custom Font from a given FontStyle
     *
     * - Parameter fontStyle: The styling to use when creating a Font.
     */
    static func custom(_ fontStyle: FontStyle) -> Font {
        if let fontName = fontStyle.name {
            return .custom(fontName, size: fontStyle.size)
        } else {
            return .system(size: fontStyle.size, weight: fontStyle.weight ?? .regular)
        }
    }

    /**
     * Create a custom Font from a given NiceTextStyle
     *
     * - Parameter textStyle: The styling to use when creating a Font.
     */
    static func custom(_ textStyle: NiceTextStyle) -> Font {
        custom(textStyle.fontStyle)
    }
}
