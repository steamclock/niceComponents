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
        newConfig.primaryButtonStyle = NiceComponents.NiceButtonStyle(
            surfaceColor: Color.orange,
            onSurfaceColor: .black,
            border: .capsule(color: .clear, width: 1)
        )
        newConfig.secondaryButtonStyle = NiceComponents.NiceButtonStyle(
            surfaceColor: Color.yellow,
            onSurfaceColor: .black,
            border: .rounded(color: .black, cornerRadius: 12, width: 1.5)
        )
        return newConfig
    }
}
