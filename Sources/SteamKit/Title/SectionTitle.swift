//
//  SectionTitle.swift
//  
//
//  Created by Brendan on 2021-01-13.
//

import SwiftUI

public struct SectionTitle: TextView {
    public let text: String
    public let style = Config.current.sectionTitle

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

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle("Section Title")
    }
}
