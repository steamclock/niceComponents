//
//  File.swift
//  
//
//  Created by Brendan Lensink on 2024-01-30.
//

import SwiftUI

public struct NiceButton: View {
    let text: String
    let style: NiceButtonStyle
    let leftImage: NiceButtonImage?
    let rightImage: NiceButtonImage?
    let action: () -> Void

    var inactive: Bool

    public init(
        _ text: String,
        style: NiceButtonStyle,
        inactive: Bool = false,
        leftImage: NiceButtonImage? = nil,
        rightImage: NiceButtonImage? = nil,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style
        self.inactive = inactive
        self.leftImage = leftImage
        self.rightImage = rightImage
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: 0) {
                if let leftImage = leftImage {
                    leftImage.image
                }

                Text(text)
                    .foregroundColor(inactive ? style.colorStyle.inactiveOnSurface : style.colorStyle.onSurface)
                    .scaledFont(
                        name: style.textStyle.font,
                        size: style.textStyle.size,
                        weight: style.textStyle.weight,
                        maxSize: style.textStyle.dynamicTypeMaxSize
                    )
                    .padding(.leading, leftImage?.offset ?? 0)
                    .padding(.trailing, leftImage?.offset ?? 0)

                if let rightImage = rightImage {
                    rightImage.image
                }
            }
            .frame(maxWidth: .infinity)
        }
        .disabled(inactive)
        .frame(height: style.height)
        .fixedSize(horizontal: false, vertical: true)
        .background(inactive ? style.colorStyle.inactiveSurface : style.colorStyle.surface)
        .cornerRadius(style.border.cornerRadius)
//        .overlay(
//            style.borderOverlay
//        )
//        .padding(style.paddingToAdd)
    }
}
