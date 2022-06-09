//
//  ScreenTitle.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct ScreenTitle: NiceText {

    public let text: NSAttributedString
    public let style: TypeStyle

    public static var defaultStyle: TypeStyle {
        Config.current.screenTitleStyle
    }

    public init(_ text: NSAttributedString, style: TypeStyle? = nil) {
        self.text = text
        self.style = style ?? Self.defaultStyle
    }

    public var body: some View {
        Text(text)
            .foregroundColor(style.color)
            .scaledFont(name: style.theme.name, size: style.theme.size, weight: style.theme.weight)
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(style.lineLimit)
    }
}

struct ScreenTitle_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTitle("Screen Title")
    }
}

