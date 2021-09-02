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
        Config.current = Theme.config
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
