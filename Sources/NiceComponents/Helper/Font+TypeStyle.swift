//
//  Font+TypeStyle.swift
//  
//
//  Created by Alejandro Zielinsky on 2022-06-30.
//

import SwiftUI

public extension Font {
    static func custom(_ typeStyle: TypeStyle) -> Font {
        if let fontName = typeStyle.theme.name {
            return .custom(fontName, size: typeStyle.theme.size)
        } else {
            return .system(size: typeStyle.theme.size, weight: typeStyle.theme.weight ?? .regular)
        }
    }
}
