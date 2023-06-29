//
//  NiceButton.swift
//  NiceComponents
//
//  Created by Alejandro Zielinsky on 2022-07-18.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// Defines a structure for buttons presented and managed with NiceComponents.
public protocol NiceButton: View {
    associatedtype DefaultBody: View

    /// Text shown inside the button.
    var text: String { get }

    /// An inactive button will not trigger its `action` when tapped.
    var inactive: Bool { get }

    /// Styling to apply to the button.
    var style: NiceButtonStyle { get }

    /// The action to be performed when the button is pressed.
    var action: () -> Void { get }

    /// The default style that should be applied to an instance of the button if a style is not provided.
    static var defaultStyle: NiceButtonStyle { get }

    @ViewBuilder var defaultBody: DefaultBody { get }

    /// An image that will show to the left of the text.
    var leftImage: NiceImage? { get set }

    /// An image that will show to the right of the text.
    var rightImage: NiceImage? { get set }

    /// If a `leftImage` is provided, the offset between it and the text.
    var leftImageOffset: CGFloat? { get set }

    /// If a `rightImage` is provided, the offset between it and the text.
    var rightImageOffset: CGFloat? { get set }

    /// Add an image to the left of any text.
    mutating func addLeftImage(_ image: NiceImage?, offset: CGFloat)

    /// Add an image to the right of any text.
    mutating func addRightImage(_ image: NiceImage?, offset: CGFloat)

    /**
     * Create a new button with the given content and style
     *
     * - Parameters:
     *  - text: The text to show in the button.
     *  - inactive: Whether the button should be interactable or not. Default is `false`.
     *  - style: The style to apply to the button. Will default to `defaultButtonStyle` if not provided.
     *  - action: The action to be performed when the button is tapped.
     */
    init(
        _ text: String,
        inactive: Bool,
        style: NiceButtonStyle?,
        action: @escaping () -> Void
    )
}

public extension NiceButton {
    /**
     * Create a new button with the given content and style options.
     *
     * - Parameters:
     *  - text: The text to show inside the button.
     *  - fontStyle: The style to apply to the button text.
     *  - height: The height of the button.
     *  - inactive: Whether the button should be interactable or not. Default is `false`.
     *  - surfaceColor: Surface color of the button.
     *  - onSurfaceColor: Color of any assets on top of your button.
     *  - inactiveSurfaceColor: Surface color when set to inactive.  Default is your background color.
     *  - inactiveOnSurfaceColor: Color of any assets on top of your button when inactive. Default is your secondary color.
     *  - border: Border style for the button. Default is none.
     *  - action: The action to perform when the button is tapped.
     */
    init(
        _ text: String,
        fontStyle: FontStyle? = nil,
        height: CGFloat? = nil,
        inactive: Bool = false,
        surfaceColor: Color? = nil,
        onSurfaceColor: Color? = nil,
        inactiveSurfaceColor: Color? = nil,
        inactiveOnSurfaceColor: Color? = nil,
        border: NiceBorderStyle? = nil,
        action: @escaping () -> Void
    ) {
        self.init(
            text,
            inactive: inactive,
            style:
                Self.defaultStyle.with(
                    fontStyle: fontStyle,
                    height: height,
                    surfaceColor: surfaceColor,
                    onSurfaceColor: onSurfaceColor,
                    inactiveSurfaceColor: inactiveSurfaceColor,
                    inactiveOnSurfaceColor: inactiveOnSurfaceColor,
                    border: border
                ),
            action: action
        )
    }
}

extension NiceButton {
    public var body: some View {
        defaultBody
    }

    public var defaultBody: some View {
        Button(action: action) {
            HStack(spacing: 0) {
                if let leftImage = leftImage {
                    leftImage
                }
                Text(text)
                    .foregroundColor(inactive ? style.inactiveOnSurfaceColor : style.onSurfaceColor)
                    .scaledFont(
                        name: style.fontStyle.name,
                        size: style.fontStyle.size,
                        weight: style.fontStyle.weight,
                        maxSize: style.fontStyle.dynamicTypeMaxSize
                    )
                    .padding(.leading, leftImageOffset ?? 0)
                    .padding(.trailing, rightImageOffset ?? 0)
                if let rightImage = rightImage {
                    rightImage
                }
            }
            .frame(maxWidth: .infinity)
        }
        .disabled(inactive)
        .frame(height: style.height)
        .fixedSize(horizontal: false, vertical: true)
        .background(inactive ? style.inactiveSurfaceColor : style.surfaceColor)
        .cornerRadius(cornerRadius)
        .overlay(
            borderOverlay
        )
        .padding(paddingToAdd)

    }

    private var paddingToAdd: CGFloat {
        if let strokeWidth = style.border.strokeStyle?.lineWidth, strokeWidth > 0.0 {
            return strokeWidth / 2
        } else if style.border.width > 0.0 {
            return style.border.width / 2
        }
        return 0.0
    }

    @ViewBuilder
    private var borderOverlay: some View {
        if let strokeStyle = style.border.strokeStyle {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(style: strokeStyle)
        } else {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(style.border.color, lineWidth: style.border.width)
        }
    }

    private var cornerRadius: CGFloat {
        if case .capsule = style.border {
            return style.height / 2
        }

        return style.border.cornerRadius
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
    mutating func addLeftImage(_ image: NiceImage?, offset: CGFloat = 8.0) {
        self.leftImage = image
        self.leftImageOffset = offset
    }

    /**
     * Add an image to the right of the button.
     *
     * - Parameters:
     *  - image: The image to display.
     *  - offset: The offset to apply to the image. Default is 8.
     */
    mutating func addRightImage(_ image: NiceImage?, offset: CGFloat = 8.0) {
        self.rightImage = image
        self.rightImageOffset = offset
    }

    /**
     * Add an image to the left of the given button.
     *
     * - Parameters:
     *  - image: The image to display.
     *  - offset: The offset to apply to the image. Default is 8.
     */
    func withLeftImage(_ image: NiceImage?, offset: CGFloat = 8.0) -> Self {
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
    func withRightImage(_ image: NiceImage?, offset: CGFloat = 8.0) -> Self {
        var copy = self
        copy.addRightImage(image, offset: offset)
        return copy
    }
}
