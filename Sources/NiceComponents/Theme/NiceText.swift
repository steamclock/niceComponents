//
//  NiceText.swift
//  
//
//  Created by Alejandro Zielinsky on 2022-06-09.
//

import SwiftUI

public protocol NiceText: View {

    var text: String { get }
    var style: TypeStyle { get }
    static var defaultStyle: TypeStyle { get }

    init(_ text: String, style: TypeStyle?)

    init(_ text: String, color: Color?, size: CGFloat?, lineLimit: Int?)
}

public extension NiceText {
    init(
        _ text: String,
        color: Color? = nil,
        size: CGFloat? = nil,
        lineLimit: Int? = nil
    ) {
        self.init(
            text,
            style: Self.defaultStyle.with(
                color: color,
                size: size,
                lineLimit: lineLimit
            )
        )
    }
}

