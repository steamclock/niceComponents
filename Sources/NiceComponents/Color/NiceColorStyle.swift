//
//  NiceColorStyle.swift
//
//
//  Created by Brendan Lensink on 2024-01-30.
//

import SwiftUI

public struct NiceColorStyle: ColorStyle {
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
        theme colorTheme: ColorTheme
    ) {
        self.primaryButton = NiceButtonColorStyle(surface: colorTheme.primary, onSurface: colorTheme.onPrimary)
        self.secondaryButton = NiceButtonColorStyle(surface: colorTheme.secondary, onSurface: colorTheme.onSecondary)
        self.destructiveButton = NiceButtonColorStyle(surface: colorTheme.error, onSurface: colorTheme.onPrimary)
        self.borderlessButton = NiceButtonColorStyle(surface: .clear, onSurface: colorTheme.primary)

        self.textField = NiceButtonColorStyle(surface: colorTheme.surface, onSurface: colorTheme.onSurface) // TODO: this wrong?

        self.screenTitle = colorTheme.onBackground
        self.sectionTitle = colorTheme.onBackground
        self.itemTitle = colorTheme.onBackground

        self.bodyText = colorTheme.onSurface
        self.detailText = colorTheme.onSurface

        self.divider = colorTheme.onSurface
        self.shadow = colorTheme.shadow
    }
}
