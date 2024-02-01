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
     * Create a custom Font from a given TextTheme
     *
     * - Parameter fontStyle: The styling to use when creating a Font.
     */
    static func custom(_ style: TextTheme) -> Font {
        if let fontName = style.font {
            return .custom(fontName, size: style.size)
        } else {
            return .system(size: style.size, weight: style.weight ?? .regular)
        }
    }
}
