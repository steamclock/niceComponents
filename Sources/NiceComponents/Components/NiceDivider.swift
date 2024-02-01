//
//  NiceDivider.swift
//  NiceComponents
//
//  Created by Brendan on 2021-03-12.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// A themed divider you can use to separate content on the page.
public struct NiceDivider: View {
    private var color: Color
    private var opacity: CGFloat

    /**
     * Create a new themed divider.
     *
     * - parameter color: The color the divider should be. Default is your config's onPrimary.
     * - parameter opacity: The opacity to use for the divider. Default is 0.6.
     */
    public init(color: Color? = nil, opacity: CGFloat? = nil) {
        self.color = Config.current.colorStyle.divider
        self.opacity = opacity ?? 0.6
    }

    public var body: some View {
        Divider()
            .background(color)
            .opacity(opacity)
            .frame(height: 1)
    }
}
