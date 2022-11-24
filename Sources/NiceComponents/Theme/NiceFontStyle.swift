//
//  FontStyle.swift
//  NiceComponents
//
//  Created by Brendan on 2022-11-22.
//

import SwiftUI

/// Styling settings for a font.
public struct NiceFontStyle {
    /// The name of the font the text should use.
    public let name: String?

    /// Font weight to use.
    public let weight: Font.Weight?

    /// The size of the text to use.
    public let size: CGFloat

    /// The maximum dynamic type size text should be scaled to.
    public var dynamicTypeMaxSize: DynamicTypeSize?

    /**
     * Create a new font style.
     *
     * - Parameters:
     *  - name: The name of the font to use.
     *  - size: The size the font should be.
     *  - weight: The font weight the font should be. Default is `nil`. TODO: Should this just be regular or something? Need to figure out where it's applied
     *  - dynamicTypeMaxSize: The maximum dynamic type size the font should be scaled to. Default is `nil`, meaning the font will scale to the maximum allowed by iOS.
     */
    public init(
        _ name: String? = nil,
        size: CGFloat,
        weight: Font.Weight? = nil,
        dynamicTypeMaxSize: DynamicTypeSize? = nil
    ) {
        self.name = name
        self.size = size
        self.weight = weight
        self.dynamicTypeMaxSize = dynamicTypeMaxSize
    }
}
