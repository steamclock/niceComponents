//
//  NiceTextStyle.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-29.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//


import SwiftUI

public struct NiceTextStyle {
    public var color: Color
    public let font: String?
    public let weight: Font.Weight?
    public let size: CGFloat
    public var tracking: CGFloat
    public var dynamicTypeMaxSize: DynamicTypeSize?
    public var lineLimit: Int?
    public var lineSpacing: CGFloat

    public init(
        color: Color,
        font: String? = nil,
        size: CGFloat? = nil,
        weight: Font.Weight? = nil,
        tracking: CGFloat? = nil,
        dynamicTypeMaxSize: DynamicTypeSize? = nil,
        lineLimit: Int? = nil,
        lineSpacing: CGFloat? = nil
    ) {
        self.color = color
        self.font = font
        self.size = size ?? 16
        self.weight = weight
        self.tracking = tracking ?? 0
        self.dynamicTypeMaxSize = dynamicTypeMaxSize
        self.lineLimit = lineLimit
        self.lineSpacing = lineSpacing ?? 0
    }

    public func with(
        color: Color? = nil,
        font: String? = nil,
        weight: Font.Weight? = nil,
        size: CGFloat? = nil,
        tracking: CGFloat? = nil,
        dynamicTypeMaxSize: DynamicTypeSize? = nil,
        lineLimit: Int? = nil,
        lineSpacing: CGFloat? = nil
    ) -> NiceTextStyle {
        NiceTextStyle(
            color: color ?? self.color,
            font: font ?? self.font,
            size: size ?? self.size, weight: weight ?? self.weight,
            tracking: tracking ?? self.tracking,
            dynamicTypeMaxSize: dynamicTypeMaxSize ?? self.dynamicTypeMaxSize,
            lineLimit: lineLimit ?? self.lineLimit,
            lineSpacing: lineSpacing ?? self.lineSpacing
        )
    }
}
