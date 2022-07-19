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
            border: .capsule(borderWidth: 1, borderColor: .clear)
        )
        newConfig.secondaryButtonStyle = NiceComponents.NiceButtonStyle(
            surfaceColor: Color.yellow,
            onSurfaceColor: .black,
            border: .rounded(radius: 12, borderWidth: 1.5, borderColor: .black)
        )
        return newConfig
    }
}
