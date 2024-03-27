//
//  NiceComponentsExampleApp.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
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
