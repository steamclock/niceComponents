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
    var primaryButton: NiceButtonColorStyle { get }
    var secondaryButton: NiceButtonColorStyle { get }
    var destructiveButton: NiceButtonColorStyle { get }
    var borderlessButton: NiceButtonColorStyle { get }

    var textField: NiceButtonColorStyle { get }

    var screenTitle: Color { get }
    var sectionTitle: Color { get }
    var itemTitle: Color { get }

    var bodyText: Color { get }
    var detailText: Color { get }

    var divider: Color { get }
    var shadow: Color { get }
}
