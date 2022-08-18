//
//  ScaledFont.swift
//  
//
//  Created by Brendan on 2021-03-05.
//

import SwiftUI

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-dynamic-type-with-a-custom-font
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
    public func scaledFont(name: String?, size: CGFloat, weight: Font.Weight?, maxSize: DynamicTypeSize? = nil) -> some View {
        return self.modifier(ScaledFont(name: name, weight: weight ?? .regular, size: size, maxSize: maxSize))
    }
}

public extension Font {
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
