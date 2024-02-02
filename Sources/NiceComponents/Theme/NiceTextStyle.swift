//
//  NiceTextStyle.swift
//  NiceComponents
//
//  Created by Brendan on 2021-03-05.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI
import NiceInit

/// Styling settings for a text element.
@NiceInit public struct NiceTextStyle {
    /// The color your text should be.
    public var color: Color

    /// The font style to apply to the text.
    public var fontStyle: FontStyle

    /// The number of lines to limit the text to.
    public var lineLimit: Int?

    /// The space between lines of the text.
    public var lineSpacing: CGFloat = 0
}
