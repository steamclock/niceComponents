//
//  Theme.swift
//  NiceComponentsExample
//
//  Created by Brendan on 2021-09-02.
//

import NiceComponents
import SwiftUI

enum Theme {
    static var config: Config {
        var newConfig = Config()
        newConfig.primaryButtonStyle = NiceButtonStyle(
            surfaceColor: Color.orange,
            onSurfaceColor: .black,
            border: .capsule(color: .clear, width: 1)
        )
        newConfig.secondaryButtonStyle = NiceButtonStyle(
            surfaceColor: Color.yellow,
            onSurfaceColor: .black,
            border: .rounded(color: .black, cornerRadius: 12, width: 1.5)
        )

        newConfig.primaryButtonStyle.fontStyle = NiceFontStyle(
            name: "Comic Sans MS",
            size: 16,
            weight: .semibold
        )

        return newConfig
    }
}
