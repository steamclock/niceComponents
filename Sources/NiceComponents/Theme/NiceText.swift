//
//  NiceText.swift
//  
//
//  Created by Alejandro Zielinsky on 2022-06-09.
//

import SwiftUI

public protocol NiceText: View {

    var text: NSAttributedString { get }
    var style: TypeStyle { get }
    static var defaultStyle: TypeStyle { get }

    init(_ text: String, style: TypeStyle?)

    init(_ text: NSAttributedString, style: TypeStyle?)

    init(_ text: String, color: Color)
}

public extension NiceText {

    init(_ text: String, style: TypeStyle? = nil) {
        self.init(NSAttributedString(string: text), style: style)
    }

    init(_ text: String, color: Color) {
        self.init(
            NSAttributedString(string: text),
            style: Self.defaultStyle.with(color: color)
        )
    }
}

