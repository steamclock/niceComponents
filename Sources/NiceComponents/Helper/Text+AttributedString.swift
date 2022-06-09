//
//  Text+AttributedString.swift
//  
//
//  Created by Alejandro Zielinsky on 2022-06-08.
//

import SwiftUI

extension Text {
    init(_ astring: NSAttributedString) {
        self.init("")

        astring.enumerateAttributes(in: NSRange(location: 0, length: astring.length), options: []) { attrs, range, _  in

            var text = Text(astring.attributedSubstring(from: range).string)

            if let color = attrs[NSAttributedString.Key.foregroundColor] as? Color {
                text = text.foregroundColor(color)
            }

            if let color = attrs[NSAttributedString.Key.foregroundColor] as? UIColor {
                text = text.foregroundColor(Color(color))
            }

            if let font = attrs[NSAttributedString.Key.font] as? Font {
                text = text.font(font)
            }

            if let font = attrs[NSAttributedString.Key.font] as? UIFont {
                text = text.font(.init(font))
            }

            if let kern = attrs[NSAttributedString.Key.kern] as? CGFloat {
                text = text.kerning(kern)
            }

            if let striked = attrs[NSAttributedString.Key.strikethroughStyle] as? NSNumber, striked != 0 {
                if let strikeColor = (attrs[NSAttributedString.Key.strikethroughColor] as? UIColor) {
                    text = text.strikethrough(true, color: Color(strikeColor))
                } else {
                    text = text.strikethrough(true)
                }
            }

            if let baseline = attrs[NSAttributedString.Key.baselineOffset] as? NSNumber {
                text = text.baselineOffset(CGFloat(baseline.floatValue))
            }

            if let underline = attrs[NSAttributedString.Key.underlineStyle] as? NSNumber, underline != 0 {
                if let underlineColor = (attrs[NSAttributedString.Key.underlineColor] as? UIColor) {
                    text = text.underline(true, color: Color(underlineColor))
                } else {
                    text = text.underline(true)
                }
            }
            // swiftlint:disable shorthand_operator
            self = self + text

        }
    }
}
