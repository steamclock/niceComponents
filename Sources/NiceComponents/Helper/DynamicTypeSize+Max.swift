//
//  DynamicTypeSize.swift
//  NiceComponents
//
//  Created by Alejandro Zielinsky on 2022-08-18.
//

import SwiftUI

public extension DynamicTypeSize {
    /**
     * Gets the max font size for a given base size, based on the given dynamic type size.
     * Max size was determined based off the iOS scaling logic given [here](https://developer.apple.com/design/human-interface-guidelines/foundations/typography/#dynamic-type-sizes)
     *
     * - parameter baseSize: The original size of the font to be scaled
     *
     * - returns: The new scaled font size.
     */
    func getMaxFontSize(for baseSize: CGFloat) -> CGFloat? {
        var resultSize: CGFloat = baseSize

        switch self {
        case .xSmall:
            resultSize = baseSize - 3.0
        case .small:
            resultSize = baseSize - 2.0
        case .medium:
            resultSize = baseSize - 1.0
        case .large:
            resultSize = baseSize
        case .xLarge:
            resultSize = baseSize + 2.0
        case .xxLarge:
            resultSize = baseSize + 4.0
        case .xxxLarge:
            resultSize = baseSize + 6.0
        case .accessibility1:
            resultSize = baseSize + 10.0
        case .accessibility2:
            resultSize = baseSize + 14.0
        case .accessibility3:
            resultSize = baseSize + 18.0
        case .accessibility4:
            resultSize = baseSize + 22.0
        case .accessibility5:
            resultSize = baseSize + 26.0
        @unknown default:
            return nil
        }

        if resultSize < 11.0 {
            return 11.0
        }

        return resultSize
    }
}
