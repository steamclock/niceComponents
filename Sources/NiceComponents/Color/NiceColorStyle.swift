//
//  NiceColorStyle.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-30.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import NiceInit
import SwiftUI

/// While a ColorTheme describes _what_ colors you'll use in an app,
/// a ColorStyle should describe _how_ they're used.
@NiceInit public struct NiceColorStyle {
    /// Color style for primary buttons.
    public var primaryButton: NiceButtonColorStyle

    /// Color style for secondary buttons.
    public var secondaryButton: NiceButtonColorStyle

    /// Color style for buttons that perform destructive actions.
    public var destructiveButton: NiceButtonColorStyle

    /// Color style for buttons without a border.
    public var borderlessButton: NiceButtonColorStyle

    /// Color style applied to text fields.
    public var textField: NiceButtonColorStyle

    /// Color used for screen titles.
    public var screenTitle: Color

    /// Color used for section titles within a screen.
    public var sectionTitle: Color

    /// Color used for item titles in lists or tables.
    public var itemTitle: Color

    /// Color used for body text.
    public var bodyText: Color

    /// Color used for detail text, such as captions or annotations.
    public var detailText: Color

    /// Color used for dividers.
    public var divider: Color
    
    /// Color used for shadows.
    public var shadow: Color

    /// Initializes a `NiceColorStyle` using a `NiceColorTheme` to derive color styles.
    /// - Parameter theme: The `NiceColorTheme` instance to derive color styles from.
    init(
        theme: NiceColorTheme
    ) {
        self.primaryButton = NiceButtonColorStyle(surface: theme.primary, onSurface: theme.onPrimary)
        self.secondaryButton = NiceButtonColorStyle(surface: theme.secondary, onSurface: theme.onSecondary)
        self.destructiveButton = NiceButtonColorStyle(surface: theme.error, onSurface: theme.onPrimary)
        self.borderlessButton = NiceButtonColorStyle(surface: .clear, onSurface: theme.primary)

        self.textField = NiceButtonColorStyle(surface: theme.surface, onSurface: theme.onSurface) // TODO: Review if correct

        self.screenTitle = theme.onBackground
        self.sectionTitle = theme.onBackground
        self.itemTitle = theme.onBackground

        self.bodyText = theme.onSurface
        self.detailText = theme.onSurface

        self.divider = theme.onSurface
        self.shadow = theme.shadow
    }
}
