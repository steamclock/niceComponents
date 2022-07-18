//
//  SecondaryButton.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct SecondaryButton: NiceButton {

    public let text: String
    public let style: NiceButtonStyle
    public let action: () -> Void
    public let disabled: Bool

    public var leftImage: ResizableImage?
    public var rightImage: ResizableImage?
    public var rightImageOffset: CGFloat?
    public var leftImageOffset: CGFloat?

    public static var defaultStyle: NiceButtonStyle {
        Config.current.secondaryButtonStyle
    }

    public init(
        _ text: String,
        style: NiceButtonStyle? = nil,
        disabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style ?? Config.current.secondaryButtonStyle
        self.disabled = disabled
        self.action = action
    }
}
