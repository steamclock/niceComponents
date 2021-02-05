//
//  Config.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct TextTheme {
    public var color: Color
    public var size: CGFloat
}

public struct Config {
    public static var current = Config()

    public var textFont: Font
    public var titleFont: Font
    public var themeColors: ThemeColors

    // Body Themes
    public var bodyText: TextTheme
    public var detailText: TextTheme
    public var errorText: TextTheme

    // Title Styles
    public var itemTitle: TextTheme
    public var screenTitle: TextTheme
    public var sectionTitle: TextTheme

    // Button Styles
    public var primaryButton: ButtonTheme
    public var secondaryButton: ButtonTheme
    public var inactiveButton: ButtonTheme
    public var destructiveButton: ButtonTheme

    public init(textFont: Font? = nil, titleFont: Font? = nil, themeColors: ThemeColors? = nil) {
        self.textFont = textFont ?? Font.body
        self.titleFont = titleFont ?? Font.title
        self.themeColors = themeColors ?? Config.defaultThemeColors

        bodyText = TextTheme(color: self.themeColors.text.primary, size: 16)
        detailText = TextTheme(color: self.themeColors.text.secondary, size: 14)
        errorText = TextTheme(color: self.themeColors.text.destructive, size: 14)

        itemTitle = TextTheme(color: self.themeColors.text.primary, size: 18)
        screenTitle = TextTheme(color: self.themeColors.text.primary, size: 32)
        sectionTitle = TextTheme(color: self.themeColors.text.primary, size: 24)

        let primaryButtonText = TextTheme(color: self.themeColors.text.inverted, size: 16)
        primaryButton = ButtonTheme(color: self.themeColors.theme.primary, height: 32, textTheme: primaryButtonText)

        let secondaryButtonText = TextTheme(color: self.themeColors.theme.secondary, size: 16)
        secondaryButton = ButtonTheme(color: self.themeColors.theme.secondary.opacity(0.1), height: 32, textTheme: secondaryButtonText, borderColor: self.themeColors.theme.secondary, borderWidth: 1)

        let inactiveButtonText = TextTheme(color: self.themeColors.text.inverted, size: 16)
        inactiveButton = ButtonTheme(color: self.themeColors.theme.inactive, height: 32, textTheme: inactiveButtonText)

        let destructiveButtonText = TextTheme(color: self.themeColors.text.destructive, size: 16)
        destructiveButton = ButtonTheme(color: self.themeColors.text.destructive.opacity(0.1), height: 32, textTheme: destructiveButtonText, borderColor: self.themeColors.text.destructive, borderWidth: 1)
    }

    private static var defaultThemeColors: ThemeColors {
        let text = ThemeColors.Text(
            primary: Color(hex: "111828"),
            secondary: Color(hex: "992BB7"),
            destructive: Color.red,
            inverted: Color.white
        )

        let theme = ThemeColors.Theme(
            primary: Color(hex: "111828"),
            secondary: Color(hex: "992BB7"),
            accent: Color(hex: "31B4A3"),
            inactive: Color(hex: "C4C4C4")
        )
        return ThemeColors(text: text, theme: theme)
    }
}
