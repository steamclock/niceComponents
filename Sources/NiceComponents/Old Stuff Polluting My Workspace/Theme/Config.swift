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
/// Themes here will be applied to any components that don't define their own theme.
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

    public var colorTheme: ColorTheme
    public var colorStyle: ColorStyle

    public var primaryButtonStyle: ButtonTheme
    public var secondaryButtonStyle: ButtonTheme
    public var borderlessButtonStyle: ButtonTheme
    public var destructiveButtonStyle: ButtonTheme

    // Even though the text field isn't really a button, it shares a lot of the same config options so we group them together
    public var textFieldStyle: ButtonTheme
    public var textFieldPlaceholderStyle: TextTheme

    public var screenTitleStyle: TextTheme
    public var sectionTitleStyle: TextTheme
    public var itemTitleStyle: TextTheme

    public var bodyTextStyle: TextTheme
    public var detailTextStyle: TextTheme

    public var shadowStyle: NiceShadowStyle

    /**
     * Create a new component configuration to use for all components in your project.
     *
     * - Parameters:
     */
    public init(colorTheme: ColorTheme? = nil, colorStyle: ColorStyle? = nil) {
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
            color: self.colorStyle.bodyText.opacity(0.8),
            size: 14
        )

        shadowStyle = NiceShadowStyle()
    }
}
