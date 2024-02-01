//
//  TextStyle.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-29.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//


import SwiftUI

public struct TextTheme {
    public var color: Color
    public let font: String?
    public let weight: Font.Weight?
    public let size: CGFloat
    public var tracking: CGFloat
    public var dynamicTypeMaxSize: DynamicTypeSize?
    public var lineLimit: Int?
    public var lineSpacing: CGFloat

    /**
     * TODO.
     *
     * - Parameters:
     *  - color: The color your text should be.
     *  - lineLimit: The number of lines to limit the text to.
     *  - lineSpacing: TODO
     *  - font: The name of the font to use.
     *  - size: The size the font should be.
     *  - weight: The font weight the font should be. Default is `nil`. TODO: Should this just be regular or something? Need to figure out where it's applied
     *  - tracking: The space between the characters.
     *  - dynamicTypeMaxSize: The maximum dynamic type size the font should be scaled to. Default is `nil`, meaning the font will scale to the maximum allowed by iOS.
     */
    public init(
        color: Color? = nil,
        font: String? = nil,
        size: CGFloat? = nil,
        weight: Font.Weight? = nil,
        tracking: CGFloat? = nil,
        lineLimit: Int? = nil,
        lineSpacing: CGFloat? = nil,
        dynamicTypeMaxSize: DynamicTypeSize? = nil
    ) {
        self.color = color ?? NiceColorTheme().onBackground // TODO: not sure the best way to do this one - should check if this updates if i remake nice color scheme
        self.font = font
        self.size = size ?? 16
        self.weight = weight
        self.tracking = tracking ?? 0
        self.lineLimit = lineLimit
        self.lineSpacing = lineSpacing ?? 0
        self.dynamicTypeMaxSize = dynamicTypeMaxSize
    }
}

public extension TextTheme {
    /**
     * Modify a text style with the given properties.
     *
     * - Parameters:
     */
    func with(
        color: Color? = nil,
        font: String? = nil,
        size: CGFloat = 16,
        weight: Font.Weight? = nil,
        tracking: CGFloat = 0,
        lineLimit: Int? = nil,
        lineSpacing: CGFloat = 0,
        dynamicTypeMaxSize: DynamicTypeSize? = nil
    ) -> TextTheme {
        TextTheme( // TODO: I think this won't work if you customize/extend NiceTextStyle and then use this, i think it will default to NiceTextStyle rather than your custom extension
            color: color,
            font: font,
            size: size,
            weight: weight,
            tracking: tracking,
            lineLimit: lineLimit,
            lineSpacing: lineSpacing,
            dynamicTypeMaxSize: dynamicTypeMaxSize
        )
    }
}
