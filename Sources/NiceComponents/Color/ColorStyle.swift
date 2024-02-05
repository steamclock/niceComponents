//
//  ColorStyle.swift
//
//
//  Created by Brendan Lensink on 2024-01-30.
//

import SwiftUI

/// While a ColorTheme describes _what_ colors you'll use in an app, 
/// a ColorStyle should describe _how_ they're used.
public protocol ColorStyle {
    var primaryButton: ButtonColorTheme { get }
    var secondaryButton: ButtonColorTheme { get }
    var destructiveButton: ButtonColorTheme { get }
    var borderlessButton: ButtonColorTheme { get }

    var textField: ButtonColorTheme { get }

    var screenTitle: Color { get }
    var sectionTitle: Color { get }
    var itemTitle: Color { get }

    var bodyText: Color { get }
    var detailText: Color { get }

    var divider: Color { get }
    var shadow: Color { get }
}
