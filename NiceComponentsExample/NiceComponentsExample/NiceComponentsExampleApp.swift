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
            surfaceColor: Color.orange,
            onSurfaceColor: .black
        )
        Config.current = newConfig
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
