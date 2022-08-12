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
        var scaledSize = UIFontMetrics.default.scaledValue(for: size)

        if let maxFontSize = maxSize?.maxFontSize {
            scaledSize = min(maxFontSize, scaledSize)
        }
        if let name = name {
            return content.font(.custom(name, size: scaledSize))
        }

        return content.font(Font.system(size: scaledSize, weight: weight))
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    public func scaledFont(name: String?, size: CGFloat, weight: Font.Weight?, maxSize: DynamicTypeSize? = nil) -> some View {
        return self.modifier(ScaledFont(name: name, weight: weight ?? .medium, size: size, maxSize: maxSize))
    }
}
