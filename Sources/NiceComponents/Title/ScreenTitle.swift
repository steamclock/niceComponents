//
//  ScreenTitle.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct ScreenTitle: View {
    public let text: String
    public let theme: TextTheme

    public init(_ text: String, theme: TextTheme? = nil) {
        self.text = text
        self.theme = theme ?? Config.current.screenTitle
    }

    public var body: some View {
        Text(text)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundColor(theme.color)
            .font(Font.system(size: theme.size))
            .lineLimit(nil)
    }
}

struct ScreenTitle_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTitle("Screen Title")
    }
}
