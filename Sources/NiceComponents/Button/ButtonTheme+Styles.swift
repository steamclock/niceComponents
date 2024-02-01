//
//  File.swift
//  
//
//  Created by Brendan Lensink on 2024-01-30.
//

import SwiftUI

public extension ButtonTheme {
    static var primary: ButtonTheme {
        Config.current.primaryButtonStyle
    }

    static var secondary: ButtonTheme {
        Config.current.secondaryButtonStyle
    }

    static var borderless: ButtonTheme {
        Config.current.borderlessButtonStyle
    }

    static var destructive: ButtonTheme {
        Config.current.destructiveButtonStyle
    }
}
