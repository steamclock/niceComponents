//
//  NiceButton.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-30.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import SwiftUI

public struct NiceButton: View {
    let text: String
    let style: NiceButtonStyle
    var leftImage: NiceButtonImage?
    var rightImage: NiceButtonImage?
    var balanceImages: Bool
    let action: () -> Void

    var inactive: Bool

    public init(
        _ text: String,
        style: NiceButtonStyle,
        inactive: Bool = false,
        leftImage: NiceButtonImage? = nil,
        rightImage: NiceButtonImage? = nil,
        balanceImages: Bool = true,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style
        self.inactive = inactive
        self.leftImage = leftImage
        self.rightImage = rightImage
        self.balanceImages = balanceImages
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: 0) {
                if let leftImage = leftImage {
                    leftImage.image
                } else if let rightImage = rightImage, balanceImages {
                    Spacer()
                         .frame(width: rightImage.image.width)
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
                } else if let leftImage = leftImage, balanceImages {
                   Spacer()
                        .frame(width: leftImage.image.width)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .disabled(inactive)
        .frame(height: style.height)
        .fixedSize(horizontal: false, vertical: true)
        .background(inactive ? style.colorStyle.inactiveSurface : style.colorStyle.surface)
        .cornerRadius(style.border.cornerRadius)
        .overlay(
            style.borderOverlay
        )
        .padding(style.paddingToAdd)

    }
}

public extension NiceButton {
    /**
     * Add an image to the left of the button.
     *
     * - Parameters:
     *  - image: The image to display.
     *  - offset: The offset to apply to the image. Default is 8.
     */
    mutating func addLeftImage(_ image: NiceImage, offset: CGFloat = NiceSpacing.small) {
        self.leftImage = NiceButtonImage(image: image, offset: offset)
    }

    /**
     * Add an image to the right of the button.
     *
     * - Parameters:
     *  - image: The image to display.
     *  - offset: The offset to apply to the image. Default is 8.
     */
    mutating func addRightImage(_ image: NiceImage, offset: CGFloat = NiceSpacing.small) {
        self.rightImage = NiceButtonImage(image: image, offset: offset)
    }

    /**
     * Add an image to the left of the given button.
     *
     * - Parameters:
     *  - image: The image to display.
     *  - offset: The offset to apply to the image. Default is 8.
     */
    func withLeftImage(_ image: NiceImage, offset: CGFloat = 8.0) -> Self {
        var copy = self
        copy.addLeftImage(image, offset: offset)
        return copy
    }

    /**
     * Add an image to the right of the given button.
     *
     * - Parameters:
     *  - image: The image to display.
     *  - offset: The offset to apply to the image. Default is 8.
     */
    func withRightImage(_ image: NiceImage, offset: CGFloat = 8.0) -> Self {
        var copy = self
        copy.addRightImage(image, offset: offset)
        return copy
    }
}
