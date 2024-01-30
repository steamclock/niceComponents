//
//  FontTheme.swift
//  NiceComponents
//
//  Created by Brendan on 2022-11-22.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// Specifies a set of attributes for a font to be styled.
public struct FontTheme {
    /// The name of the font the text should use.
    public let name: String?

    /// Font weight to use.
    public let weight: Font.Weight?

    /// The size of the text to use.
    public let size: CGFloat

    /// The space between the characters.
    public var tracking: CGFloat
    
    /// The maximum dynamic type size text should be scaled to.
    public var dynamicTypeMaxSize: DynamicTypeSize?

    /**
     * Create a new font theme.
     *
     * - Parameters:
     *  - name: The name of the font to use.
     *  - size: The size the font should be.
     *  - weight: The font weight the font should be. Default is `nil`. TODO: Should this just be regular or something? Need to figure out where it's applied
     *  - tracking: The space between the characters.
     *  - dynamicTypeMaxSize: The maximum dynamic type size the font should be scaled to. Default is `nil`, meaning the font will scale to the maximum allowed by iOS.
     */
    public init(
        _ name: String? = nil,
        size: CGFloat,
        weight: Font.Weight? = nil,
        tracking: CGFloat = 0,
        dynamicTypeMaxSize: DynamicTypeSize? = nil
    ) {
        self.name = name
        self.size = size
        self.weight = weight
        self.tracking = tracking
        self.dynamicTypeMaxSize = dynamicTypeMaxSize
    }
}
