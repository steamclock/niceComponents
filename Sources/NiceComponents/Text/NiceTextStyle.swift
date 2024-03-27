//
//  NiceTextStyle.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import NiceInit
import SwiftUI

/// A struct representing a style for text elements in SwiftUI.
@NiceInit public struct NiceTextStyle {
    /// The color of the text.
    public var color: Color

    /// The font of the text.
    public var font: String?

    /// The size of the text. Default is 16.
    public var size: CGFloat = 16

    /// The weight of the text. Default is .regular.
    public var weight: Font.Weight = .regular

    /// The tracking value of the text. Only applied if running on iOS 16+. Default is 0.
    public var tracking: CGFloat = 0

    /// The maximum size for dynamic type scaling.
    public var dynamicTypeMaxSize: DynamicTypeSize?

    /// The maximum number of lines for the text.
    public var lineLimit: Int?

    /// The spacing between lines of text.
    public var lineSpacing: CGFloat?
}
