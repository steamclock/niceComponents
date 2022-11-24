//
//  ScaledFont.swift
//  NiceComponents
//
//  Created by Brendan on 2021-03-05.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// Set the Font for a view while respecting Dynamic Type sizing and styling.
/// https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-dynamic-type-with-a-custom-font
public struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String?
    var weight: Font.Weight
    var size: CGFloat
    var maxSize: DynamicTypeSize?

    public func body(content: Content) -> some View {
        return content.font(.scaledFont(name: name, size: size, weight: weight, maxSize: maxSize))
    }
}

extension View {
    /*
     * Set a view's font property using the provided scaled font.
     *
     * - Parameters
     *      - name: The name of the font to use.
     *      - size: The size of the font you'd like to use as a base
     *      - weight: The weight of the font to use. Default is `nil`.
     *      - maxSize: The max DynamicTypeSize to scale to. Default is `nil`.
     *
     * - Returns: The font, scaled to the correct size
     */
    public func scaledFont(name: String?, size: CGFloat, weight: Font.Weight?, maxSize: DynamicTypeSize? = nil) -> some View {
        return self.modifier(ScaledFont(name: name, weight: weight ?? .regular, size: size, maxSize: maxSize))
    }
}

public extension Font {
    /*
     * Create a new scaled font, given a base font, size and weight.
     *
     * - Parameters
     *      - name: The name of the font to use.
     *      - size: The size of the font you'd like to use as a base
     *      - weight: The weight of the font to use. Default is `nil`.
     *      - maxSize: The max DynamicTypeSize to scale to. Default is `nil`.
     *
     * - Returns: The font, scaled to the correct size
     */
    static func scaledFont(name: String?, size: CGFloat, weight: Font.Weight? = nil, maxSize: DynamicTypeSize? = nil) -> Font {
        var scaledSize = UIFontMetrics.default.scaledValue(for: size)
        
        if let maxFontSize = maxSize?.getMaxFontSize(for: size) {
            scaledSize = min(maxFontSize, scaledSize)
        }
        if let name = name {
            return Self.custom(name, size: scaledSize)
        }

        return Font.system(size: scaledSize, weight:  weight ?? .regular)
    }
}
