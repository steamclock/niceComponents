//
//  ButtonStyle+Styles.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-30.
//  Copyright © 2024 Steamclock Software. All rights reserved.
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
