//
//  NiceButton.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import SwiftUI

/// A SwiftUI view that represents a customizable button component.
public struct NiceButton: View {
    /// The text displayed on the button.
    let text: String

    /// The style configuration for the button.
    let style: NiceButtonStyle

    /// Padding between the text and edges of the button. Default is 8.
    /// Ignored if maxWidth is set, overridden by imageOffsets.
    var textPadding: CGFloat?

    /// Set max width for the button, dictating if it should fill all available space or not.
    /// Pass in .infinity to have the button fill all available width, null to have it size to fit.
    /// Default is .infinity.
    var maxWidth: CGFloat?

    /// An optional image to display on the left side of the button.
    var leftImage: NiceButtonImage?

    /// An optional image to display on the right side of the button.
    var rightImage: NiceButtonImage?

    /// A Boolean value indicating whether the images should be balanced or
    ///     if adding an image should push your text off center.
    var balanceImages: Bool

    /// The closure executed when the button is tapped.
    let action: () -> Void

    /// Indicates whether the button is in an inactive state.
    var inactive: Bool

    /// Initializes a new button with the provided parameters.
    /// - Parameters:
    ///   - text: The text to display on the button.
    ///   - style: The style configuration for the button.
    ///   - inactive: A Boolean value that determines whether the button is inactive. Defaults to `false`.
    ///   - leftImage: An optional image to display on the left side of the button.
    ///   - rightImage: An optional image to display on the right side of the button.
    ///   - balanceImages: A Boolean value indicating whether the images should be balanced. Defaults to `true`.
    ///   - action: The closure to execute when the button is tapped.
    public init(
        _ text: String,
        style: NiceButtonStyle,
        inactive: Bool = false,
        balanceImages: Bool = true,
        maxWidth: CGFloat? = .infinity,
        leftImage: NiceButtonImage? = nil,
        rightImage: NiceButtonImage? = nil,
        textPadding: CGFloat? = 8,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style
        self.inactive = inactive
        self.balanceImages = balanceImages
        self.maxWidth = maxWidth
        self.leftImage = leftImage
        self.rightImage = rightImage
        self.textPadding = textPadding
        self.action = action
    }

    // TODO: I think it may be worth writing a bunch of convenience functions here
    //       to make it easier for folks to get in and customize style options,
    //       but want to hold off until APIs are settled.

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
                   .padding(.leading, leftImage?.offset ?? textPadding ?? 0)
                   .padding(.trailing, rightImage?.offset ?? textPadding ?? 0)
               if let rightImage = rightImage {
                   rightImage.image
               }
           }
           .frame(maxWidth: maxWidth)
       }
       .disabled(inactive)
       .frame(height: style.height)
       .fixedSize(horizontal: false, vertical: true)
       .background(inactive ? style.colorStyle.inactiveSurface : style.colorStyle.surface)
       .cornerRadius(style.cornerRadius)
       .overlay(
           style.borderOverlay
       )
       .padding(style.paddingToAdd)
    }
}

public extension NiceButton {
    /// Adds an image to the left side of the button.
    /// - Parameters:
    ///   - image: The `NiceImage` to be displayed on the left.
    ///   - offset: The horizontal offset for the image. Defaults to a small predefined spacing.
    mutating func addLeftImage(_ image: NiceImage, offset: CGFloat = NiceSpacing.small) {
        self.leftImage = NiceButtonImage(image, offset: offset)
    }

    /// Adds an image to the right side of the button.
    /// - Parameters:
    ///   - image: The `NiceImage` to be displayed on the right.
    ///   - offset: The horizontal offset for the image. Defaults to a small predefined spacing.
    mutating func addRightImage(_ image: NiceImage, offset: CGFloat = NiceSpacing.small) {
        self.rightImage = NiceButtonImage(image, offset: offset)
    }

    /// Returns a new `NiceButton` instance with an image added to the left side.
    /// - Parameters:
    ///   - image: The `NiceImage` to be displayed on the left.
    ///   - offset: The horizontal offset for the image. Defaults to 8.0.
    func withLeftImage(_ image: NiceImage, offset: CGFloat = 8.0) -> Self {
        var copy = self
        copy.addLeftImage(image, offset: offset)
        return copy
    }

    /// Returns a new `NiceButton` instance with an image added to the right side.
    /// - Parameters:
    ///   - image: The `NiceImage` to be displayed on the right.
    ///   - offset: The horizontal offset for the image. Defaults to 8.0.
    func withRightImage(_ image: NiceImage, offset: CGFloat = 8.0) -> Self {
        var copy = self
        copy.addRightImage(image, offset: offset)
        return copy
    }
}
