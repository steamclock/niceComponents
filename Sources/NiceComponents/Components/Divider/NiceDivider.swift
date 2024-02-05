//
//  NiceDivider.swift
//  NiceComponents
//
//  Created by Brendan on 2021-03-12.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI



public struct NiceDivider: View {
    let style: DividerTheme

    public init(style: DividerTheme = NiceDividerStyle()) {
        self.style = style
    }

    public var body: some View {
        Divider()
            .background(style.color)
            .opacity(style.opacity)
            .frame(height: style.height)
    }
}
