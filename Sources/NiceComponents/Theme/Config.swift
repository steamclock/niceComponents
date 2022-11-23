//
//  Config.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import os
import SwiftUI

/// Global settings for all components.
/// Themes here will be applied to any components that don't define their own theme.
public struct Config {
    /// Your current component configuration.
    /// Note that you can only set this configuration once, ideally during app startup.
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
    public var typeTheme: TypeTheme

    // Button Styles
    public var borderlessButtonStyle: NiceButtonStyle
    public var destructiveButtonStyle: NiceButtonStyle
    public var primaryButtonStyle: NiceButtonStyle
    public var secondaryButtonStyle: NiceButtonStyle

    // Text Styles

    public var bodyTextStyle: NiceTextStyle
    public var detailTextStyle: NiceTextStyle
    public var itemTitleStyle: NiceTextStyle
    public var screenTitleStyle: NiceTextStyle
    public var sectionTitleStyle: NiceTextStyle

    /// Default is: x:0, y:4, blur: 4px, opacity: 0.15 (black)
    public var shadowStyle: ShadowStyle

    public init(colorTheme: ColorTheme? = nil, typeTheme: TypeTheme? = nil) {
        self.colorTheme = colorTheme ?? ColorTheme()
        self.typeTheme = typeTheme ?? TypeTheme()

        // Set Button styles
        
        borderlessButtonStyle = NiceButtonStyle(
            fontStyle: self.typeTheme.button,
            surfaceColor: Color.clear,
            onSurfaceColor: self.colorTheme.primary,
            border: NiceBorderStyle.none
        )

        destructiveButtonStyle = NiceButtonStyle(
            fontStyle: self.typeTheme.button,
            surfaceColor: self.colorTheme.error,
            onSurfaceColor: self.colorTheme.onError
        )

        primaryButtonStyle = NiceButtonStyle(
            fontStyle: self.typeTheme.button,
            surfaceColor: self.colorTheme.primary,
            onSurfaceColor: self.colorTheme.onPrimary
        )

        secondaryButtonStyle = NiceButtonStyle(
            fontStyle: self.typeTheme.button,
            surfaceColor: self.colorTheme.secondary,
            onSurfaceColor: self.colorTheme.onSecondary
        )

        // Set Text styles

        bodyTextStyle = NiceTextStyle(
            color: self.colorTheme.onSurface,
            fontStyle: self.typeTheme.body1
        )

        detailTextStyle = NiceTextStyle(
            color: self.colorTheme.onSurface,
            fontStyle: self.typeTheme.caption // body2?
        )

        // Set Title styles

        itemTitleStyle = NiceTextStyle(
            color: self.colorTheme.onSurface,
            fontStyle: self.typeTheme.itemTitle
        )

        screenTitleStyle = NiceTextStyle(
            color: self.colorTheme.onSurface,
            fontStyle: self.typeTheme.screenTitle
        )

        sectionTitleStyle = NiceTextStyle(
            color: self.colorTheme.onSurface,
            fontStyle: self.typeTheme.sectionTitle
        )

        // Set Shadow style

        shadowStyle = ShadowStyle(
            color: self.colorTheme.shadow,
            radius: 4.0,
            x: 0,
            y: 4
        )
    }

}
