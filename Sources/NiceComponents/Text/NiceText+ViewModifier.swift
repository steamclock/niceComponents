//
//  NiceText+ViewModifier.swift
//  NiceComponents
//
//  Created by Brendan on 2024-01-29.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import SwiftUI

struct NiceTextModifier: ViewModifier {
    let style: NiceTextStyle

    func body(content: Content) -> some View {
        content
            .foregroundStyle(style.color)
            .scaledFont(
                name: style.font,
                size: style.size,
                weight: style.weight,
                maxSize: style.dynamicTypeMaxSize
            )
            .fixedSize(horizontal: false, vertical: true)
    }
}

public extension View {
    func niceText(_ style: NiceTextStyle) -> some View {
        modifier(NiceTextModifier(style: style))
    }
}
