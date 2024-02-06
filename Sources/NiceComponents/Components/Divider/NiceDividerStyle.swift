//
//  NiceDividerStyle.swift
//
//
//  Created by Brendan Lensink on 2024-02-05.
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