//
//  PrimaryButton.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public typealias LocalResizableImage = ResizableImage<EmptyView>

public struct PrimaryButton: NiceButton {

    public let text: String
    public let style: NiceButtonStyle
    public let action: () -> Void
    public let inactive: Bool

    public var leftImage: LocalResizableImage?
    public var rightImage: LocalResizableImage?
    public var rightImageOffset: CGFloat?
    public var leftImageOffset: CGFloat?

    public static var defaultStyle: NiceButtonStyle {
        Config.current.primaryButtonStyle
    }

    public init(
        _ text: String,
        style: NiceButtonStyle? = nil,
        disabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style ?? Config.current.primaryButtonStyle
        self.inactive = disabled
        self.action = action
    }
}
