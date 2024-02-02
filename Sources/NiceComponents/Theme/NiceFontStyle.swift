//
//  FontStyle.swift
//  NiceComponents
//
//  Created by Brendan on 2022-11-22.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI
import NiceInit

/// Styling settings for a font.
@NiceInit public struct FontStyle {
    /// The name of the font the text should use.
    public let name: String?

    /// The size of the text to use.
    public let size: CGFloat

    /// Font weight to use.
    public let weight: Font.Weight?

    /// The space between the characters.
    public var tracking: CGFloat = 0

    /// The maximum dynamic type size text should be scaled to.
    public var dynamicTypeMaxSize: DynamicTypeSize?
}
