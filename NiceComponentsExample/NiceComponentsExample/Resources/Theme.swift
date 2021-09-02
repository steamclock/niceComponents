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
        newConfig.primaryButtonStyle = NiceComponents.ButtonStyle(
            surfaceColor: Color.orange,
            onSurfaceColor: .black
        )
        return newConfig
    }
}
