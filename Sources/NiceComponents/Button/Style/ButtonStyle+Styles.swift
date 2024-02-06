//
//  File.swift
//  
//
//  Created by Brendan Lensink on 2024-01-30.
//

import SwiftUI

public extension NiceButtonStyle {
    static var primary: NiceButtonStyle {
        Config.current.primaryButtonStyle
    }

    static var secondary: NiceButtonStyle {
        Config.current.secondaryButtonStyle
    }

    static var borderless: NiceButtonStyle {
        Config.current.borderlessButtonStyle
    }

    static var destructive: NiceButtonStyle {
        Config.current.destructiveButtonStyle
    }
}
