//
//  TypeTheme.swift
//  
//
//  Created by Brendan on 2021-03-05.
//

import SwiftUI

public struct TypeTheme {
    public struct Text {
        let name: String?
        let weight: Font.Weight?
        let size: CGFloat

        public init(_ name: String? = nil, size: CGFloat, weight: Font.Weight? = nil) {
            self.name = name
            self.size = size
            self.weight = weight
        }
    }

    public var headline1 = Text(size: 48, weight: .semibold)
    public var headline2 = Text(size: 34, weight: .semibold)
    public var headline3 = Text(size: 24, weight: .semibold)
    public var headline4 = Text(size: 20, weight: .semibold)

    public var subtitle1 = Text(size: 16, weight: .semibold)
    public var subtitle2 = Text(size: 14, weight: .semibold)

    public var body1 = Text(size: 16)
    public var body2 = Text(size: 14)

    public var button = Text(size: 14)
    public var caption = Text(size: 12)
    public var overline = Text(size: 12)
}
