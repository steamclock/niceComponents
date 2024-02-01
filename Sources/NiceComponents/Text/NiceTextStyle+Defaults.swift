//
//  File.swift
//  
//
//  Created by Brendan Lensink on 2024-01-29.
//

import SwiftUI

// It's kind of weird to declare these here only to stick them in Config,
// but I feel like it's a lot easier to read this way...
extension TextTheme {
    static var defaultScreenTitleStyle: TextTheme {
        TextTheme(
            size: 48,
            weight: .semibold
        )
    }

    static var defaultSectionTitleStyle: TextTheme {
        TextTheme(
            size: 34,
            weight: .semibold
        )
    }

    static var defaultItemTitleStyle: TextTheme {
        TextTheme(
            size: 20,
            weight: .semibold
        )
    }

    static var defaultBody: TextTheme {
        TextTheme()
    }

    static var defaultDetail: TextTheme {
        TextTheme(
            size: 14
        )
    }
}
