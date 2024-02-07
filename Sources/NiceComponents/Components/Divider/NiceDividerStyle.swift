//
//  NiceDividerStyle.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-30.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import SwiftUI

/// Defines the style for a divider, including its color, height, and opacity.
public struct NiceDividerStyle {
    /// The color of the divider.
    public let color: Color

    /// The thickness (height) of the divider.
    public let height: CGFloat
    
    /// The opacity of the divider, determining its transparency.
    public let opacity: CGFloat

    /// Initializes the divider style with optional custom color, height, and opacity values.
    /// - Parameters:
    ///   - color: The color of the divider. Uses the default divider color from `Config` if not specified.
    ///   - height: The thickness (height) of the divider. Defaults to 1 if not specified.
    ///   - opacity: The opacity of the divider. Defaults to 0.6 if not specified.
    public init(color: Color? = nil, height: CGFloat? = nil, opacity: CGFloat? = nil) {
        self.color = color ?? Config.current.colorStyle.divider
        self.height = height ?? 1
        self.opacity = opacity ?? 0.6
    }
}
