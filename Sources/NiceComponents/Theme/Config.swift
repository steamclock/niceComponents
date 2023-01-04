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

    /// The collection of color styles and settings used across components.
    public var colorTheme: ColorTheme

    /// The collection of font styles used across components.
    public var fontTheme: FontTheme

    // Button Styles
    public var primaryButtonStyle: NiceButtonStyle
    public var secondaryButtonStyle: NiceButtonStyle
    public var borderlessButtonStyle: NiceButtonStyle
    public var destructiveButtonStyle: NiceButtonStyle

    // Text and Title Styles

    public var itemTitleStyle: NiceTextStyle
    public var screenTitleStyle: NiceTextStyle
    public var sectionTitleStyle: NiceTextStyle

    public var bodyTextStyle: NiceTextStyle
    public var detailTextStyle: NiceTextStyle

    /// Default is: x:0, y:4, blur: 4px, opacity: 0.15 (black)
    public var shadowStyle: NiceShadowStyle

    /**
     * Create a new component configuration to use for all components in your project.
     *
     * - Parameters:
     *  - colorTheme: The collection of color styles and settings used across components.
     *  - fontTheme: The collection of font styles used across components.
     */
    public init(colorTheme: ColorTheme? = nil, fontTheme: FontTheme? = nil) {
        self.colorTheme = colorTheme ?? ColorTheme()
        self.fontTheme = fontTheme ?? FontTheme()

        // Set Button styles

        primaryButtonStyle = NiceButtonStyle(
            fontStyle: self.fontTheme.button,
            surfaceColor: self.colorTheme.primary,
            onSurfaceColor: self.colorTheme.onPrimary,
            border: .rounded(color: self.colorTheme.primary, cornerRadius: 8, width: 1)
        )

        secondaryButtonStyle = NiceButtonStyle(
            fontStyle: self.fontTheme.button,
            surfaceColor: self.colorTheme.secondary,
            onSurfaceColor: self.colorTheme.onSecondary,
            border: .rounded(color: self.colorTheme.secondary, cornerRadius: 8, width: 1)
        )
        
        borderlessButtonStyle = NiceButtonStyle(
            fontStyle: self.fontTheme.button,
            surfaceColor: Color.clear,
            onSurfaceColor: self.colorTheme.primary,
            border: NiceBorderStyle.none
        )

        destructiveButtonStyle = NiceButtonStyle(
            fontStyle: self.fontTheme.button,
            surfaceColor: self.colorTheme.error,
            onSurfaceColor: self.colorTheme.onError,
            border: .rounded(color: self.colorTheme.error, cornerRadius: 8, width: 1)
        )

        // Set Text styles

        bodyTextStyle = NiceTextStyle(
            color: self.colorTheme.onSurface,
            fontStyle: self.fontTheme.body
        )

        detailTextStyle = NiceTextStyle(
            color: self.colorTheme.onSurface,
            fontStyle: self.fontTheme.detail
        )

        // Set Title styles

        itemTitleStyle = NiceTextStyle(
            color: self.colorTheme.onSurface,
            fontStyle: self.fontTheme.itemTitle
        )

        screenTitleStyle = NiceTextStyle(
            color: self.colorTheme.onSurface,
            fontStyle: self.fontTheme.screenTitle
        )

        sectionTitleStyle = NiceTextStyle(
            color: self.colorTheme.onSurface,
            fontStyle: self.fontTheme.sectionTitle
        )

        // Set Shadow style

        shadowStyle = NiceShadowStyle(
            color: self.colorTheme.shadow,
            radius: 4.0,
            x: 0,
            y: 4
        )
    }

}
