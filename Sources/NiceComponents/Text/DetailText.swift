//
//  DetailText.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct DetailText: View {
    public let text: String
    public let theme: TextTheme

    public init(_ text: String, theme: TextTheme? = nil) {
        self.text = text

        self.theme = theme ?? Config.current.detailText
    }

    public var body: some View {
        Text(text)
            .foregroundColor(theme.color)
            .font(Config.current.textFont(size: theme.size))
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(nil)
    }
}

struct DetailText_Previews: PreviewProvider {
    static var previews: some View {
        DetailText("Detail Text")
    }
}
