//
//  FontTheme.swift
//  NiceComponents
//
//  Created by Brendan on 2021-03-05.
//

import SwiftUI

/// A collection of styling settings for fonts used throughout components.
public struct FontTheme {
    public var screenTitle: FontStyle
    public var sectionTitle: FontStyle
    public var itemTitle: FontStyle

    public var body: FontStyle
    public var detail: FontStyle

    public var button: FontStyle

    /**
     * Create a new type theme by providing overrides for any styles you'd like to customize
     *
     * - Parameters:
     *  - screenTitle: The screen title font style to apply. Default is size 48 semibold.
     *  - sectionTitle: The section title font style to apply. Default is size 34 semibold.
     *  - itemTitle: The item title font style to apply. Default is size 20 semibold.
     *  - body: The body type font style to apply. Default is size 16 regular.
     *  - detail: The body detail type font style to apply. Default is size 14 regular.
     *  - button: The button font style to apply. Default is size 14 regular.
     */
    public init(
        screenTitle: FontStyle? = nil,
        sectionTitle: FontStyle? = nil,
        itemTitle: FontStyle? = nil,
        body: FontStyle? = nil,
        detail: FontStyle? = nil,
        button: FontStyle? = nil
    ) {
        self.screenTitle = screenTitle ?? FontStyle(size: 48, weight: .semibold)
        self.sectionTitle = sectionTitle ?? FontStyle(size: 34, weight: .semibold)
        self.itemTitle = itemTitle ?? FontStyle(size: 20, weight: .semibold)

        self.body = body ?? FontStyle(size: 16)
        self.detail = detail ?? FontStyle(size: 14)

        self.button = button ?? FontStyle(size: 14)
    }
}
