//
//  NiceDividerStyle.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-30.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import SwiftUI

public struct NiceDividerStyle {
    public let color: Color
    public let height: CGFloat
    public let opacity: CGFloat

    public init(color: Color? = nil, height: CGFloat? = nil, opacity: CGFloat? = nil) {
        self.color = color ?? Config.current.colorStyle.divider
        self.height = height ?? 1
        self.opacity = opacity ?? 0.6
    }
}
