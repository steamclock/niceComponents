//
//  NiceBorderStyle.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import SwiftUI

/// Defines the border style for a component.
public enum NiceBorderStyle {
    /// No border is shown.
    case none

    /// A standard, square border.
    case border(color: Color, width: CGFloat)

    /// A rounded, pill-style, border.
    case capsule(color: Color? = nil, width: CGFloat? = nil)

    /// A rounded border with customizable corner radius.
    case rounded(color: Color? = nil, cornerRadius: CGFloat, width: CGFloat? = nil)

    /// Set a custom border with the built-in StrokeStyle.
    case stroke(strokeStyle: StrokeStyle)

    var color: Color {
        switch self {
        case .border(let color, _): return color
        case .capsule(let color, _), .rounded(let color, _, _):
            if let color = color {
                return color
            }

            fallthrough
        default:
            return .clear
        }
    }

    var width: CGFloat {
        switch self {
        case .border(_, let width): return width
        case .capsule(_, let width), .rounded(_, _, let width):
            if let width = width {
                return width
            }

            fallthrough
        default:
            return 0.0
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .rounded(_, let radius, _): return radius
        default: return 0.0
        }
    }

    var strokeStyle: StrokeStyle? {
        switch self {
        case .stroke(let strokeStyle): return strokeStyle
        default: return nil
        }
    }
}
