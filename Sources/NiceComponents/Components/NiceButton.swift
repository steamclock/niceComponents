//
//  NiceButton.swift
//  
//
//  Created by Alejandro Zielinsky on 2022-07-18.
//

import SwiftUI

public protocol NiceButton: View {
    associatedtype DefaultBody: View

    var text: String { get }
    var style: NiceButtonStyle { get }
    var action: () -> Void { get }
    var inactive: Bool { get }
    static var defaultStyle: NiceButtonStyle { get }
    @ViewBuilder var defaultBody: DefaultBody { get }

    var leftImage: NiceImage? { get set }
    var rightImage: NiceImage? { get set }
    var leftImageOffset: CGFloat? { get set }
    var rightImageOffset: CGFloat? { get set }

    mutating func addLeftImage(_ image: NiceImage?, spacing: CGFloat)
    mutating func addRightImage(_ image: NiceImage?, spacing: CGFloat)

    init(
        _ text: String,
        style: NiceButtonStyle?,
        inactive: Bool,
        action: @escaping () -> Void
    )
}

public extension NiceButton {
    init(
        _ text: String,
        inactive: Bool = false,
        fontStyle: FontStyle? = nil,
        height: CGFloat? = nil,
        surfaceColor: Color? = nil,
        onSurfaceColor: Color? = nil,
        inactiveColor: Color? = nil,
        inactiveOnSurfaceColor: Color? = nil,
        border: NiceBorderStyle? = nil,
        action: @escaping () -> Void
    ) {
        self.init(
            text,
            style:
                Self.defaultStyle.with(
                    fontStyle: fontStyle,
                    height: height,
                    surfaceColor: surfaceColor,
                    onSurfaceColor: onSurfaceColor,
                    inactiveSurfaceColor: inactiveColor,
                    inactiveOnSurfaceColor: inactiveOnSurfaceColor,
                    border: border
                ),
            inactive: inactive,
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
                    .padding(.leading, leftImageOffset)
                    .padding(.trailing, rightImageOffset)
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
        .cornerRadius(style.borderStyle.cornerRadius)
        .overlay(
            borderOverlay
        )
        .padding(paddingToAdd)

    }

    private var paddingToAdd: CGFloat {
        if let strokeWidth = style.borderStyle.strokeStyle?.lineWidth, strokeWidth > 0.0 {
            return strokeWidth / 2
        } else if style.borderStyle.width > 0.0 {
            return style.borderStyle.width / 2
        }
        return 0.0
    }

    @ViewBuilder
    private var borderOverlay: some View {
        if let strokeStyle = style.borderStyle.strokeStyle {
            RoundedRectangle(cornerRadius: style.borderStyle.cornerRadius)
                .stroke(style: strokeStyle)
        } else {
            RoundedRectangle(cornerRadius: style.borderStyle.cornerRadius)
                .stroke(style.borderStyle.color, lineWidth: style.borderStyle.width)
        }
    }
}

public extension NiceButton {
    mutating func addLeftImage(_ image: NiceImage?, spacing: CGFloat) {
        self.leftImage = image
        self.leftImageOffset = spacing
    }

    mutating func addRightImage(_ image: NiceImage?, spacing: CGFloat) {
        self.rightImage = image
        self.rightImageOffset = spacing
    }

    func withLeftImage(_ image: NiceImage?, spacing: CGFloat = 8.0) -> Self {
        var copy = self
        copy.addLeftImage(image, spacing: spacing)
        return copy
    }

    func withRightImage(_ image: NiceImage?, spacing: CGFloat = 8.0) -> Self {
        var copy = self
        copy.addRightImage(image, spacing: spacing)
        return copy
    }
}
