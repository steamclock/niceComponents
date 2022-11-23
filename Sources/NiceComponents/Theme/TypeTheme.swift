//
//  TypeTheme.swift
//  
//
//  Created by Brendan on 2021-03-05.
//

import SwiftUI

/// A collection of styling settings for text elements.
public struct TypeTheme {
    public var screenTitle: FontStyle
    public var sectionTitle: FontStyle
    public var itemTitle: FontStyle

    public var subtitle1: FontStyle
    public var subtitle2: FontStyle

    public var body1: FontStyle
    public var body2: FontStyle

    public var button: FontStyle
    public var caption: FontStyle
    public var overline: FontStyle

    /**
     * Create a new type theme by providing overrides for any styles you'd like to customize
     *
     * - Parameters:
     *  - screenTitle: The screen title style to apply. Default is size 48 semibold.
     *  - sectionTitle: The section title style to apply. Default is size 34 semibold.
     *  - itemTitle: The item title style to apply. Default is size 20 semibold.
     *  - subtitle1: The subtitle style to apply. Default is size 16 semibold.
     *  - subtitle2: The subtitle2 style to apply. Default is size 14 semibold.
     *  - body1: The body style to apply. Default is size 16.
     *
     */
    public init(
        screenTitle: FontStyle? = nil,
        sectionTitle: FontStyle? = nil,
        itemTitle: FontStyle? = nil,
        subtitle1: FontStyle? = nil,
        subtitle2: FontStyle? = nil,
        body1: FontStyle? = nil,
        body2: FontStyle? = nil,
        button: FontStyle? = nil,
        caption: FontStyle? = nil,
        overline: FontStyle? = nil
    ) {
        self.screenTitle = screenTitle ?? FontStyle(size: 48, weight: .semibold)
        self.sectionTitle = sectionTitle ?? FontStyle(size: 34, weight: .semibold)
        self.itemTitle = itemTitle ?? FontStyle(size: 20, weight: .semibold)

        self.subtitle1 = subtitle1 ?? FontStyle(size: 16, weight: .semibold)
        self.subtitle2 = subtitle2 ?? FontStyle(size: 14, weight: .semibold)

        self.body1 = body1 ?? FontStyle(size: 16)
        self.body2 = body2 ?? FontStyle(size: 14)

        self.button = button ?? FontStyle(size: 14)
        self.caption = caption ?? FontStyle(size: 12)
        self.overline = overline ?? FontStyle(size: 12)

    }
}
