//
//  Font+TypeStyle.swift
//  
//
//  Created by Alejandro Zielinsky on 2022-06-30.
//

import SwiftUI

// TODO: What do you even do with this 
public extension Font {
    static func custom(_ fontStyle: FontStyle) -> Font {
        if let fontName = fontStyle.name {
            return .custom(fontName, size: fontStyle.size)
        } else {
            return .system(size: fontStyle.size, weight: fontStyle.weight ?? .regular)
        }
    }

    static func custom(_ textStyle: NiceTextStyle) -> Font {
        custom(textStyle.fontStyle)
    }
}
