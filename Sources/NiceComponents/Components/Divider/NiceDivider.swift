//
//  NiceDivider.swift
//  NiceComponents
//
//  Created by Brendan on 2021-03-12.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// A view that creates a line divider with customizable style.
public struct NiceDivider: View {
    /// The style applied to the divider.
    let style: NiceDividerStyle

    /// Initializes the divider with an optional custom style.
    /// - Parameter style: The style to apply to the divider. Uses a default style if not specified.
    public init(style: NiceDividerStyle? = nil) {
        self.style = style ?? NiceDividerStyle()
    }

    /// The body of the `NiceDivider`, defining its appearance based on the specified style.
    public var body: some View {
        Divider()
            .background(style.color ?? Config.current.colorStyle.divider)
            .opacity(style.opacity)
            .frame(height: style.height)
    }
}
