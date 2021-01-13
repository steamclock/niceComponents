//
//  BodyText.swift
//  
//
//  Created by Brendan on 2021-01-13.
//

import SwiftUI

public struct BodyText: TextView {
    public let text: String
    public let style = Config.current.bodyText

    public init(_ text: String) {
        self.text = text
    }

    public var body: some View {
        Text(text)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundColor(style.color)
            .font(Font.system(size: style.size))
            .lineLimit(nil)
    }
}
