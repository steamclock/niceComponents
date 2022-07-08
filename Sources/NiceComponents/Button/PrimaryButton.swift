//
//  PrimaryButton.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct PrimaryButton: NiceButton {
    public let text: String
    public let style: ButtonStyle
    public let action: () -> Void
    public let disabled: Bool
    public let disabledStyle: ButtonStyle?

    public private(set) var leftImage: ResizableImage?
    public private(set) var rightImage: ResizableImage?

    public static var defaultStyle: ButtonStyle {
        Config.current.primaryButtonStyle
    }

    public init(
        _ text: String,
        style: ButtonStyle? = nil,
        leftImage: ResizableImage? = nil,
        rightImage: ResizableImage? = nil,
        disabled: Bool = false,
        disabledStyle: ButtonStyle? = nil,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style ?? Config.current.primaryButtonStyle
        self.leftImage = leftImage
        self.rightImage = rightImage
        self.disabled = disabled
        self.disabledStyle = disabledStyle
        self.action = action
    }
    //@ViewBuilder label: (() -> Label)?

    public var body: some View {
        defaultBody
//        Button(action: onClick) {
//            Text(text)
//                .foregroundColor(style.onSurfaceColor)
//                .scaledFont(name: style.textStyle.name, size: style.textStyle.size, weight: style.textStyle.weight)
//                .frame(maxWidth: .infinity, minHeight: style.height, maxHeight: style.height)
//        }
//        .fixedSize(horizontal: false, vertical: true)
//        .background(style.surfaceColor)
//        .cornerRadius(style.border.radius)
//        .overlay(
//            RoundedRectangle(cornerRadius: style.border.radius)
//                .stroke(style.border.color, lineWidth: style.border.width)
//        )
    }
}

//PrimaryButton: NiceButton
// init( text, style?, disabled?, disabledStyle?, onClick)
// RoundedButtonStyle

public protocol NiceButton: View {
    associatedtype DefaultBody : View
    associatedtype Label: View
    var text: String { get }
    var leftImage: ResizableImage? { mutating get }
    var rightImage: ResizableImage? { mutating get }
    var style: ButtonStyle { get }
    var action: () -> Void { get }
    var disabled: Bool { get }
    var disabledStyle: ButtonStyle? { get }
    static var defaultStyle: ButtonStyle { get }
    @ViewBuilder var defaultBody: Self.DefaultBody { get }
    @ViewBuilder var label: Self.Label? { get set }

    init(
        _ text: String,
        style: ButtonStyle?,
        leftImage: ResizableImage?,
        rightImage: ResizableImage?,
        disabled: Bool,
        disabledStyle: ButtonStyle?,
        action: @escaping () -> Void
    )

    init(_ text: String, style: ButtonStyle?, action: @escaping () -> Void)
    init(action: @escaping () -> Void, style: ButtonStyle?, @ViewBuilder label: () -> Label)

    //    public init(_ text: String, style: ButtonStyle? = nil, onClick: @escaping () -> Void) {
    //        self.text = text
    //        self.style = style ?? Config.current.primaryButtonStyle
    //        self.onClick = onClick
    //    }
}


extension NiceButton {

    public init(action: @escaping () -> Void, style: ButtonStyle? = nil, @ViewBuilder label: () -> Label) {
        self.init("", style: style, leftImage: nil, rightImage: nil, disabled: false, disabledStyle: nil, action: action)
        self.label = label()
    }

    public var defaultBody: some View {
        Button(action: action) {
            label
        }
        .fixedSize(horizontal: false, vertical: true)
        .background(style.surfaceColor)
        .cornerRadius(style.border.radius)
        .overlay(
            RoundedRectangle(cornerRadius: style.border.radius)
                .stroke(style.border.color, lineWidth: style.border.width)
        )
    }
}

extension NiceButton where Label == Text {
    init(_ text: String, style: ButtonStyle?, action: @escaping () -> Void) {
        self.init(text, style: style, leftImage: nil, rightImage: nil, disabled: false, disabledStyle: nil, action: action)
        self.label = defaultTextLabel
    }

    var defaultTextLabel: some View {
        Text(text)
            .foregroundColor(style.onSurfaceColor)
            .scaledFont(name: style.textStyle.name, size: style.textStyle.size, weight: style.textStyle.weight)
            .frame(maxWidth: .infinity, minHeight: style.height, maxHeight: style.height)
    }

}
