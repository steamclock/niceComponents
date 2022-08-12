//
//  DynamicTypeSize+MaxSize.swift
//  
//
//  Created by Brendan on 2022-08-12.
//

import SwiftUI

extension DynamicTypeSize {
    var maxFontSize: CGFloat? {
        switch self {
        case .xSmall: return 30
        case .small: return 31
        case .medium: return 32
        case .large: return 34
        case .xLarge: return 37
        case .xxLarge: return 40
        case .xxxLarge: return 45
        case .accessibility1: return 52
        case .accessibility2: return 62
        case .accessibility3: return 74
        case .accessibility4: return 86
        case .accessibility5: return 96
        @unknown default:
            return nil
        }
    }
}
