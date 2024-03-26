//
//  ButtonStyle+Styles.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-30.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import SwiftUI

/// Extends `NiceButtonStyle` with predefined styles for convenience.
public extension NiceButtonStyle {
    /// The primary style for buttons, typically used for the most important action in a view.
    static var primary: NiceButtonStyle {
        Config.current.primaryButtonStyle
    }

    /// The secondary style for buttons, used for actions of lesser importance than the primary action.
    static var secondary: NiceButtonStyle {
        Config.current.secondaryButtonStyle
    }

    /// A borderless style for buttons, often used for minimalistic or less prominent actions.
    static var borderless: NiceButtonStyle {
        Config.current.borderlessButtonStyle
    }

    /// A style for buttons that perform destructive actions, such as deleting or removing.
    static var destructive: NiceButtonStyle {
        Config.current.destructiveButtonStyle
    }
}
