//
//  BorderlessButton.swift
//  NiceComponents
//
//  Created by Brendan on 2021-07-13.
//

import SwiftUI

/// A themed button with no border.
public struct BorderlessButton: NiceButton {
    public let text: String
    public let inactive: Bool
    public let style: NiceButtonStyle
    public let action: () -> Void

    public var leftImage: NiceImage?
    public var rightImage: NiceImage?

    public var leftImageOffset: CGFloat?
    public var rightImageOffset: CGFloat?

    public static var defaultStyle: NiceButtonStyle {
        Config.current.borderlessButtonStyle
    }

    /**
     * Create a new borderless button.
     *
     * - Parameters:
     *  - text: The body text of the button.
     *  - inactive: Whether the button should be interactable or not. Default is `false`.
     *  - style: The styling to apply to the button. Defaults to the current `borderlessButtonStyle` in your config.
     *  - action: The action to be performed when the button is tapped.
     */
    public init(
        _ text: String,
        inactive: Bool = false,
        style: NiceButtonStyle? = nil,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.inactive = inactive
        self.style = style ?? Config.current.borderlessButtonStyle
        self.action = action
    }
}
