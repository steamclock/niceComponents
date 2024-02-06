//
//  NiceTextStyle.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-29.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import NiceInit
import SwiftUI

@NiceInit public struct NiceTextStyle {
    public var color: Color
    public var font: String?
    public var size: CGFloat = 16
    public var weight: Font.Weight = .regular
    public var tracking: CGFloat = 0
    public var dynamicTypeMaxSize: DynamicTypeSize?
    public var lineLimit: Int?
    public var lineSpacing: CGFloat?
}
