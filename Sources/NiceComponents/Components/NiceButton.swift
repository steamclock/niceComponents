//
//  NiceButton.swift
//  
//
//  Created by Alejandro Zielinsky on 2022-07-18.
//

import SwiftUI

public protocol NiceButton: View {
    associatedtype DefaultBody : View
    var text: String { get }
    var style: NiceButtonStyle { get }
    var action: () -> Void { get }
    var inactive: Bool { get }
    static var defaultStyle: NiceButtonStyle { get }
    @ViewBuilder var defaultBody: DefaultBody { get }

    var leftImage: LocalResizableImage? { get set }
    var rightImage: LocalResizableImage? { get set }
    var leftImageOffset: CGFloat? { get set }
    var rightImageOffset: CGFloat? { get set }

    mutating func addLeftImage(_ image: LocalResizableImage?, spacing: CGFloat)
    mutating func addRightImage(_ image: LocalResizableImage?, spacing: CGFloat)

    init(
        _ text: String,
        style: NiceButtonStyle?,
        disabled: Bool,
        action: @escaping () -> Void
    )
}

public extension NiceButton {
    init(
        _ text: String,
        disabled: Bool = false,
        textStyle: TypeTheme.TextStyle? = nil,
        height: CGFloat? = nil,
        surfaceColor: Color? = nil,
        onSurfaceColor: Color? = nil,
        disabledColor: Color? = nil,
        disabledOnSurfaceColor: Color? = nil,
        border: NiceBorderStyle? = nil,
        action: @escaping () -> Void
    ) {
        self.init(
            text,
            style:
                Self.defaultStyle.with(
                    textStyle: textStyle,
                    height: height,
                    surfaceColor: surfaceColor,
                    onSurfaceColor: onSurfaceColor,
                    disabledSurfaceColor: disabledColor,
                    disabledOnSurfaceColor: disabledOnSurfaceColor,
                    border: border
                ),
            disabled: disabled,
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
                    .foregroundColor(inactive ? style.disabledOnSurfaceColor : style.onSurfaceColor)
                    .scaledFont(name: style.textStyle.name, size: style.textStyle.size, weight: style.textStyle.weight)
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
        .background(inactive ? style.disabledSurfaceColor : style.surfaceColor)
        .cornerRadius(style.cornerRadius)
        .overlay(
            borderOverlay
        )
        .padding(paddingToAdd)

    }

    private var paddingToAdd: CGFloat {
        if let strokeWidth = style.strokeStyle?.lineWidth, strokeWidth > 0.0 {
            return strokeWidth / 2
        } else if style.borderWidth > 0.0 {
            return style.borderWidth / 2
        }
        return 0.0
    }

    @ViewBuilder
    private var borderOverlay: some View {
        if let strokeStyle = style.strokeStyle {
            RoundedRectangle(cornerRadius: style.cornerRadius)
                .stroke(style: strokeStyle)
        } else {
            RoundedRectangle(cornerRadius: style.cornerRadius)
                .stroke(style.borderColor, lineWidth: style.borderWidth)
        }
    }
}

public extension NiceButton {

    mutating func addLeftImage(_ image: LocalResizableImage?, spacing: CGFloat) {
        self.leftImage = image
        self.leftImageOffset = spacing
    }

    mutating func addRightImage(_ image: LocalResizableImage?, spacing: CGFloat) {
        self.rightImage = image
        self.rightImageOffset = spacing
    }

    func withLeftImage(_ image: LocalResizableImage?, spacing: CGFloat = 8.0) -> Self {
        var copy = self
        copy.addLeftImage(image, spacing: spacing)
        return copy
    }

    func withRightImage(_ image: LocalResizableImage?, spacing: CGFloat = 8.0) -> Self {
        var copy = self
        copy.addRightImage(image, spacing: spacing)
        return copy
    }
}
