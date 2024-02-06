//
//  NiceColorStyle.swift
//
//
//  Created by Brendan Lensink on 2024-01-30.
//

import NiceInit
import SwiftUI

/// While a ColorTheme describes _what_ colors you'll use in an app,
/// a ColorStyle should describe _how_ they're used.
@NiceInit public struct NiceColorStyle {
    public var primaryButton: NiceButtonColorStyle
    public var secondaryButton: NiceButtonColorStyle
    public var destructiveButton: NiceButtonColorStyle
    public var borderlessButton: NiceButtonColorStyle
    
    public var textField: NiceButtonColorStyle

    public var screenTitle: Color
    public var sectionTitle: Color
    public var itemTitle: Color

    public var bodyText: Color
    public var detailText: Color

    public var divider: Color
    public var shadow: Color

    init(
        theme: NiceColorTheme
    ) {
        self.primaryButton = NiceButtonColorStyle(surface: theme.primary, onSurface: theme.onPrimary)
        self.secondaryButton = NiceButtonColorStyle(surface: theme.secondary, onSurface: theme.onSecondary)
        self.destructiveButton = NiceButtonColorStyle(surface: theme.error, onSurface: theme.onPrimary)
        self.borderlessButton = NiceButtonColorStyle(surface: .clear, onSurface: theme.primary)

        self.textField = NiceButtonColorStyle(surface: theme.surface, onSurface: theme.onSurface) // TODO: this wrong?

        self.screenTitle = theme.onBackground
        self.sectionTitle = theme.onBackground
        self.itemTitle = theme.onBackground

        self.bodyText = theme.onSurface
        self.detailText = theme.onSurface

        self.divider = theme.onSurface
        self.shadow = theme.shadow
    }
}
