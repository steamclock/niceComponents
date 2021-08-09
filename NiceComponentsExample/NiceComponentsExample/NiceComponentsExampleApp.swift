//
//  NiceComponentsExampleApp.swift
//  NiceComponentsExample
//
//  Created by Brendan on 2021-01-29.
//

import NiceComponents
import SwiftUI

@main
struct NiceComponentsExampleApp: App {
    init() {
        var newConfig = Config()
        newConfig.primaryButtonStyle = NiceComponents.ButtonStyle(
            textStyle: Config.current.typeTheme.body1,
            surfaceColor: Color.red,
            onSurfaceColor: .black
        )
        newConfig.primaryButtonStyle.textStyle = TypeTheme.TextStyle(size: 16, weight: .semibold)
        Config.current = newConfig
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
