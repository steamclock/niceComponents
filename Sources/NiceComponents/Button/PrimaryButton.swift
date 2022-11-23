//
//  PrimaryButton.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

/// A button themed to indicate a primary action.
public struct PrimaryButton: NiceButton {

    public let text: String
    public let style: NiceButtonStyle
    public let action: () -> Void
    public let inactive: Bool

    public var leftImage: NiceImage?
    public var rightImage: NiceImage?
    public var rightImageOffset: CGFloat?
    public var leftImageOffset: CGFloat?

    public static var defaultStyle: NiceButtonStyle {
        Config.current.primaryButtonStyle
    }

    /*
     * Create a new primary button.
     *
     * - Parameters:
     *  - text: The body text of the button.
     *  - style: The styling to apply to the button. Defaults to the current `primaryButtonStyle` in your config.
     *  - inactive: Whether the button should be interactable or not. Default is `false`.
     *  - action: The action to be performed when the button is tapped.
     */
    public init(
        _ text: String,
        style: NiceButtonStyle? = nil,
        inactive: Bool = false,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style ?? Config.current.primaryButtonStyle
        self.inactive = inactive
        self.action = action
    }
}
