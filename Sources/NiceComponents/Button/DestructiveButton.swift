//
//  DestructiveButton.swift
//  NiceComponents
//
//  Created by Brendan on 2021-02-05.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// A button themed to signal that the action associated with it is destructive.
public struct DestructiveButton: NiceButton {
    public let text: String
    public let inactive: Bool
    public let style: NiceButtonStyle
    public let action: () -> Void

    public var leftImage: NiceImage?
    public var rightImage: NiceImage?
    public var rightImageOffset: CGFloat?
    public var leftImageOffset: CGFloat?

    public static var defaultStyle: NiceButtonStyle {
        Config.current.destructiveButtonStyle
    }

    /*
     * Create a new destructive button.
     *
     * - Parameters:
     *  - text: The body text of the button.
     *  - inactive: Whether the button should be interactable or not. Default is `false`.
     *  - style: The styling to apply to the button. Defaults to the current `destructiveButtonStyle` in your config.
     *  - action: The action to be performed when the button is tapped.
     */
    public init(
        _ text: String,
        inactive: Bool = false,
        style: NiceButtonStyle? = nil,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.inactive = false
        self.style = style ?? Config.current.destructiveButtonStyle
        self.action = action
    }
}
