//
//  NiceBorderStyle.swift
//  
//
//  Created by Alejandro Zielinsky on 2022-07-18.
//

import SwiftUI

/// Defines the border style for a component
public enum NiceBorderStyle {
    case none
    case capsule(borderWidth: CGFloat?, borderColor: Color?)
    case rounded(radius: CGFloat, borderWidth: CGFloat?, borderColor: Color?)
    case border(borderWidth: CGFloat, borderColor: Color)
    case stroke(strokeStyle: StrokeStyle)
}
