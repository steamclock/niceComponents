//
//  SectionTitle.swift
//
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct SectionTitle: View {
    public let text: String
    public let style: TypeStyle

    public init(_ text: String, style: TypeStyle? = nil) {
        self.text = text
        self.style = style ?? Config.current.sectionTitleStyle
    }

    public var body: some View {
        Text(text)
            .foregroundColor(style.color)
            .scaledFont(name: style.theme.name, size: style.theme.size, weight: style.theme.weight)
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(style.lineLimit)
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle("Section Title")
    }
}
