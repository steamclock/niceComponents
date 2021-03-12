//
//  ThemedDivider.swift
//  
//
//  Created by Brendan on 2021-03-12.
//

import SwiftUI

public struct ThemedDivider: View {
    private var color: Color

    public init(color: Color? = nil) {
        self.color = color ?? Config.current.colorTheme.onPrimary
    }

    public var body: some View {
        Divider()
            .background(color)
            .opacity(0.6)
    }
}
