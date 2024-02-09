//
//  Config.swift
//  NiceComponents
//
//  Created by Brendan on 2021-01-29.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import os
import SwiftUI

/// Global settings for all components.
/// Styles defined here will be applied to any components that don't define their own.
public struct Config {
    /// Your current component configuration.
    /// Note that you can only set this configuration once, ideally during app startup. Subsequent updates will be ignored.
    public static var current: Config {
        get {
            return _current
        }

        set {
            guard !hasSetConfig else {
                os_log("Error! Config has already been set once, at startup. Ignoring config update. ")
                return
            }

            hasSetConfig = true
            _current = newValue
        }
    }
    private static var _current = Config()
    private static var hasSetConfig: Bool = false

    /// The color theme for the application, influencing all components.
    public var colorTheme: NiceColorTheme

    /// Defines the primary color style for components.
    public var colorStyle: NiceColorStyle

    /// Style for primary buttons in the app.
    public var primaryButtonStyle: NiceButtonStyle

    /// Style for secondary buttons in the app.
    public var secondaryButtonStyle: NiceButtonStyle

    /// Style for buttons without borders.
    public var borderlessButtonStyle: NiceButtonStyle

    /// Style for buttons that perform destructive actions.
    public var destructiveButtonStyle: NiceButtonStyle

    /// Style for text fields. Despite not being a button, shares many styling options with buttons.
    public var textFieldStyle: NiceButtonStyle

    /// Style for placeholder text in text fields.
    public var textFieldPlaceholderStyle: NiceTextStyle

    /// Style for screen titles.
    public var screenTitleStyle: NiceTextStyle

    /// Style for section titles.
    public var sectionTitleStyle: NiceTextStyle

    /// Style for item titles.
    public var itemTitleStyle: NiceTextStyle

    /// Style for general body text.
    public var bodyTextStyle: NiceTextStyle

    /// Style for detailed text, possibly smaller or less emphasized.
    public var detailTextStyle: NiceTextStyle

    /// Global shadow style for components requiring depth or elevation.
    public var shadowStyle: NiceShadowStyle

    /// Create a new component configuration to use for all components in your project.
    /// - Parameters:
    ///   - colorTheme: The color theme to apply to all the components. See the README for more info on how this works.
    ///   - colorStyle: The color style to apply to specific components. Will fall back to colorTheme if unspecified.
    public init(colorTheme: NiceColorTheme? = nil, colorStyle: NiceColorStyle? = nil) {
        self.colorTheme = colorTheme ?? NiceColorTheme()
        self.colorStyle = colorStyle ?? NiceColorStyle(theme: self.colorTheme)

        // Set Text styles

        screenTitleStyle = NiceTextStyle(
            color: self.colorStyle.screenTitle,
            size: 48,
            weight: .semibold
        )

        sectionTitleStyle = NiceTextStyle(
            color: self.colorStyle.sectionTitle,
            size: 34,
            weight: .semibold
        )

        itemTitleStyle = NiceTextStyle(
            color: self.colorStyle.itemTitle,
            size: 20,
            weight: .semibold
        )

        bodyTextStyle = NiceTextStyle(
            color: self.colorStyle.bodyText
        )

        detailTextStyle = NiceTextStyle(
            color: self.colorStyle.detailText,
            size: 14
        )

        // Set Button styles

        primaryButtonStyle = NiceButtonStyle(
            textStyle: self.bodyTextStyle,
            height: 44,
            colorStyle: NiceButtonColorStyle(
                surface: self.colorStyle.primaryButton.surface,
                onSurface: self.colorStyle.primaryButton.onSurface
            ),
            border: .rounded(cornerRadius: NiceSpacing.small)
        )

        secondaryButtonStyle = NiceButtonStyle(
            textStyle: self.bodyTextStyle,
            height: 44,
            colorStyle: NiceButtonColorStyle(
                surface: self.colorStyle.secondaryButton.surface,
                onSurface: self.colorStyle.secondaryButton.onSurface
            ),
            border: .rounded(cornerRadius: NiceSpacing.small)
        )

        borderlessButtonStyle = NiceButtonStyle(
            textStyle: self.bodyTextStyle,
            height: 44,
            colorStyle: NiceButtonColorStyle(
                surface: self.colorStyle.borderlessButton.surface,
                onSurface: self.colorStyle.borderlessButton.onSurface
            )
        )

        destructiveButtonStyle = NiceButtonStyle(
            textStyle: self.bodyTextStyle,
            height: 44,
            colorStyle: NiceButtonColorStyle(
                surface: self.colorStyle.destructiveButton.surface,
                onSurface: self.colorStyle.destructiveButton.onSurface
            ),
            border: .rounded(cornerRadius: NiceSpacing.small)
        )

        textFieldStyle = NiceButtonStyle(
            textStyle: self.bodyTextStyle,
            height: 44,
            colorStyle: NiceButtonColorStyle(
                surface: self.colorStyle.textField.surface,
                onSurface: self.colorStyle.textField.onSurface
            ),
            border: .rounded(color: self.colorTheme.background, cornerRadius: 8, width: 2)
        )

        textFieldPlaceholderStyle = NiceTextStyle(
            color: self.colorStyle.textField.onSurface,
            size: 10
        )

        shadowStyle = NiceShadowStyle()
    }
}
