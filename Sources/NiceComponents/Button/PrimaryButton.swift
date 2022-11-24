//
//  PrimaryButton.swift
//  NiceComponents
//
//  Created by Brendan on 2021-01-29.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// A button themed to indicate a primary action.
public struct PrimaryButton: NiceButton {
    public let text: String
    public let inactive: Bool
    public let style: NiceButtonStyle
    public let action: () -> Void

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
     *  - inactive: Whether the button should be interactable or not. Default is `false`.
     *  - style: The styling to apply to the button. Defaults to the current `primaryButtonStyle` in your config.
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
        self.style = style ?? Config.current.primaryButtonStyle
        self.action = action
    }
}
