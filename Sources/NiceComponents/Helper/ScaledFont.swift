//
//  ScaledFont.swift
//  
//
//  Created by Brendan on 2021-03-05.
//

import SwiftUI

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-dynamic-type-with-a-custom-font
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String?
    var weight: Font.Weight
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        if let name = name {
            return content.font(.custom(name, size: scaledSize))
        }

        return content.font(Font.system(size: scaledSize, weight: weight))
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    func scaledFont(name: String?, size: CGFloat, weight: Font.Weight?) -> some View {
        return self.modifier(ScaledFont(name: name, weight: weight ?? .medium, size: size))
    }
}
