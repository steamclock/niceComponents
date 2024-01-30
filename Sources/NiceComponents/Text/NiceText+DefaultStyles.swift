//
//  File.swift
//  
//
//  Created by Brendan Lensink on 2024-01-29.
//

import SwiftUI

// It's kind of weird to declare these here only to stick them in Config,
// but I feel like it's a lot easier to read this way...
extension NiceTextStyle {
    static var defaultBody: NiceTextStyle {
        NiceTextStyle(
            fontTheme: FontTheme(size: 16),
            textTheme: TextTheme(color: .black)
        )
    }

    static var defaultDetail: NiceTextStyle {
        NiceTextStyle(
            fontTheme: FontTheme(size: 14),
            textTheme: TextTheme(color: .black)
        )
    }
    
    static var defaultScreenTitleStyle: NiceTextStyle {
        NiceTextStyle(
            fontTheme: FontTheme(size: 48, weight: .semibold),
            textTheme: TextTheme(color: .black)
        )
    }

    static var defaultSectionTitleStyle: NiceTextStyle {
        NiceTextStyle(
            fontTheme: FontTheme(size: 34, weight: .semibold),
            textTheme: TextTheme(color: .black)
        )
    }

    static var defaultItemTitleStyle: NiceTextStyle {
        NiceTextStyle(
            fontTheme: FontTheme(size: 20, weight: .semibold),
            textTheme: TextTheme(color: .black)
        )
    }
}
