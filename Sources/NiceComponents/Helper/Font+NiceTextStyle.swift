//
//  Font+NiceTextStyle.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import SwiftUI

public extension Font {
    /// Create a custom Font from a given TextTheme
    /// - Parameter fontStyle: The styling to use when creating a Font.
    /// - Returns: A Font using the size and weight specified in your NiceTextStyle
    static func custom(_ style: NiceTextStyle) -> Font {
        if let fontName = style.font {
            return .custom(fontName, size: style.size)
        } else {
            return .system(size: style.size, weight: style.weight)
        }
    }
}
