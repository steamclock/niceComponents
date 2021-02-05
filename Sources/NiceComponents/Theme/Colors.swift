//
//  Colors.swift
//
//
//  Created by Brendan on 2021-02-05.
//

import SwiftUI

public struct ThemeColors {
    public struct Text {
        public var primary: Color
        public var secondary: Color
        public var destructive: Color
        public var inverted: Color
    }

    var text: Text

    public struct Theme {
        public let primary: Color
        public let secondary: Color
        public let accent: Color
        public let inactive: Color
    }

    var theme: Theme
}

