//
//  TypeTheme.swift
//  
//
//  Created by Brendan on 2021-03-05.
//

import SwiftUI

public struct TypeTheme {
    public struct TextStyle {
        public let name: String?
        public let weight: Font.Weight?
        public let size: CGFloat
        public var dynamicTypeMaxSize: DynamicTypeSize?

        public init(
            _ name: String? = nil,
            size: CGFloat,
            weight: Font.Weight? = nil,
            dynamicTypeMaxSize: DynamicTypeSize? = nil
        ) {
            self.name = name
            self.size = size
            self.weight = weight
            self.dynamicTypeMaxSize = dynamicTypeMaxSize
        }
    }

    public var headline1: TextStyle
    public var headline2: TextStyle
    public var headline3: TextStyle
    public var headline4: TextStyle
    public var subtitle1: TextStyle
    public var subtitle2: TextStyle

    public var body1: TextStyle
    public var body2: TextStyle

    public var button: TextStyle
    public var caption: TextStyle
    public var overline: TextStyle

    public init(headline1: TextStyle? = nil,
            headline2: TextStyle? = nil,
            headline3: TextStyle? = nil,
            headline4: TextStyle? = nil,
            subtitle1: TextStyle? = nil,
            subtitle2: TextStyle? = nil,
            body1: TextStyle? = nil,
            body2: TextStyle? = nil,
            button: TextStyle? = nil,
            caption: TextStyle? = nil,
            overline: TextStyle? = nil ) {
        self.headline1 = headline1 ?? TextStyle(size: 48, weight: .semibold)
        self.headline2 = headline2 ?? TextStyle(size: 34, weight: .semibold)
        self.headline3 = headline3 ?? TextStyle(size: 24, weight: .semibold)
        self.headline4 = headline4 ?? TextStyle(size: 20, weight: .semibold)

        self.subtitle1 = subtitle1 ?? TextStyle(size: 16, weight: .semibold)
        self.subtitle2 = subtitle2 ?? TextStyle(size: 14, weight: .semibold)

        self.body1 = body1 ?? TextStyle(size: 16)
        self.body2 = body2 ?? TextStyle(size: 14)

        self.button = button ?? TextStyle(size: 14)
        self.caption = caption ?? TextStyle(size: 12)
        self.overline = overline ?? TextStyle(size: 12)

    }
}
