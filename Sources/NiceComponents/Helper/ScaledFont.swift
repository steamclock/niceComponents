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
    var maxSize: CGFloat?

    public func body(content: Content) -> some View {
        return content.font(.scaledFont(name: name, size: size, weight: weight, maxSize: maxSize))
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    public func scaledFont(name: String?, size: CGFloat, weight: Font.Weight?, maxSize: CGFloat? = nil) -> some View {
        return self.modifier(ScaledFont(name: name, weight: weight ?? .regular, size: size, maxSize: maxSize))
    }
}

public extension Font {
    static func scaledFont(name: String?, size: CGFloat, weight: Font.Weight? = nil, maxSize: CGFloat? = nil) -> Font {
        var scaledSize = UIFontMetrics.default.scaledValue(for: size)

        if let maxFontSize = maxSize {
            scaledSize = min(maxFontSize, scaledSize)
        }
        if let name = name {
            return Self.custom(name, size: scaledSize)
        }

        return Font.system(size: scaledSize, weight:  weight ?? .regular)
    }
}
