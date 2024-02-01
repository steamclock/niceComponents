//
//  NiceColorStyle.swift
//
//
//  Created by Brendan Lensink on 2024-01-30.
//

import SwiftUI

public struct NiceColorStyle: ColorStyle {
    public let primaryButton: ButtonColorStyle
    public let secondaryButton: ButtonColorStyle
    public let destructiveButton: ButtonColorStyle
    public let borderlessButton: ButtonColorStyle

    public var screenTitle: Color
    public var sectionTitle: Color
    public var itemTitle: Color

    public var bodyText: Color
    public var detailText: Color

    public var divider: Color
    public var shadow: Color

    init(
        primaryButton: ButtonColorStyle? = nil,
        secondaryButton: ButtonColorStyle? = nil,
        destructiveButton: ButtonColorStyle? = nil,
        borderlessButton: ButtonColorStyle? = nil,
        screenTitle: Color? = nil,
        sectionTitle: Color? = nil,
        itemTitle: Color? = nil,
        bodyText: Color? = nil,
        detailText: Color? = nil,
        divider: Color? = nil,
        shadow: Color? = nil
    ) {
        let defaultTheme = NiceColorTheme()

        self.primaryButton = primaryButton ?? ButtonColorStyle(surface: defaultTheme.primary, onSurface: defaultTheme.onPrimary)
        self.secondaryButton = secondaryButton ?? ButtonColorStyle(surface: defaultTheme.secondary, onSurface: defaultTheme.onSecondary)
        self.destructiveButton = destructiveButton ?? ButtonColorStyle(surface: defaultTheme.error, onSurface: defaultTheme.onPrimary)
        self.borderlessButton = borderlessButton ?? ButtonColorStyle(surface: .clear, onSurface: defaultTheme.primary)

        self.screenTitle = defaultTheme.onBackground
        self.sectionTitle = defaultTheme.onBackground
        self.itemTitle = defaultTheme.onBackground

        self.bodyText = defaultTheme.onSurface
        self.detailText = defaultTheme.onSurface

        self.divider = defaultTheme.onSurface
        self.shadow = defaultTheme.shadow
    }
}

public extension NiceColorStyle {
    func with(
        primaryButton: ButtonColorStyle? = nil,
        secondaryButton: ButtonColorStyle? = nil,
        destructiveButton: ButtonColorStyle? = nil,
        borderlessButton: ButtonColorStyle? = nil,
        screenTitle: Color? = nil,
        sectionTitle: Color? = nil,
        itemTitle: Color? = nil,
        bodyText: Color? = nil,
        detailText: Color? = nil,
        shadow: Color? = nil
    ) -> NiceColorStyle {
        NiceColorStyle(
            primaryButton: primaryButton,
            secondaryButton: secondaryButton,
            destructiveButton: destructiveButton,
            borderlessButton: borderlessButton,
            screenTitle: screenTitle,
            sectionTitle: sectionTitle,
            itemTitle: itemTitle,
            bodyText: bodyText,
            detailText: detailText,
            shadow: shadow
        )
    }
}
