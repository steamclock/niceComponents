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

    public var textTheme: TextTheme

    public var primaryButtonStyle: ButtonTheme
    public var secondaryButtonStyle: ButtonTheme
    public var borderlessButtonStyle: ButtonTheme
    public var destructiveButtonStyle: ButtonTheme

    // Even thouh the text field isn't really a button, it shares a lot of the same config options so we group them together
    public var textFieldStyle: ButtonTheme
    public var textFieldPlaceholderStyle: TextTheme

    public var screenTitleStyle: TextTheme
    public var sectionTitleStyle: TextTheme
    public var itemTitleStyle: TextTheme

    public var bodyTextStyle: TextTheme
    public var detailTextStyle: TextTheme

    /// Default is: x:0, y:4, blur: 4px, opacity: 0.15 (black)
    public var shadowStyle: NiceShadowStyle

    /**
     * Create a new component configuration to use for all components in your project.
     *
     * - Parameters:
     */
    public init(colorTheme: ColorTheme? = nil, colorStyle: ColorStyle? = nil, textStyle: TextTheme? = nil) {
        self.colorTheme = colorTheme ?? NiceColorTheme()
        self.colorStyle = colorStyle ?? NiceColorStyle()
        self.textTheme = textStyle ?? TextTheme()

        // Set Text styles

        screenTitleStyle = TextTheme.defaultScreenTitleStyle
        sectionTitleStyle = TextTheme.defaultSectionTitleStyle
        itemTitleStyle = TextTheme.defaultItemTitleStyle

        bodyTextStyle = TextTheme.defaultBody
        detailTextStyle = TextTheme.defaultDetail

        // Set Button styles

        primaryButtonStyle = ButtonTheme(
            textStyle: TextTheme.defaultBody,
            height: 44,
            surfaceColor: self.colorTheme.primary,
            onSurfaceColor: self.colorTheme.onPrimary,
            border: .rounded(cornerRadius: NiceSpacing.small) // TODO: use config width here
        )

        secondaryButtonStyle = ButtonTheme(
            textStyle: TextTheme.defaultBody,
            height: 44,
            surfaceColor: self.colorTheme.secondary,
            onSurfaceColor: self.colorTheme.onSecondary,
            border: .rounded(cornerRadius: NiceSpacing.small)
        )

        borderlessButtonStyle = ButtonTheme(
            textStyle: TextTheme.defaultBody,
            height: 44,
            surfaceColor: Color.clear,
            onSurfaceColor: self.colorTheme.primary
        )

        destructiveButtonStyle = ButtonTheme(
            textStyle: TextTheme.defaultBody,
            height: 44,
            surfaceColor: self.colorTheme.error,
            onSurfaceColor: self.colorTheme.onError,
            border: .rounded(cornerRadius: NiceSpacing.small)
        )

        /// OLD STUFF
//        textFieldStyle = NiceButtonStyle(
//            fontStyle: fontTheme ,
//            height: 56,
//            surfaceColor: self.colorTheme.surface,
//            onSurfaceColor: self.colorTheme.onSurface
////            border: .rounded(color: self.colorTheme.background, cornerRadius: 8, width: 2)
//        )
//
//        textFieldPlaceholderStyle = NiceTextStyle(
//            fontTheme: FontTheme(size: 12),
//            textTheme: TextTheme(color: colorTheme.onSurface)
//        )



        shadowStyle = NiceShadowStyle()
    }
}
