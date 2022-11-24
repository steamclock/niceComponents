//
//  NiceComponentsExampleApp.swift
//  NiceComponentsExample
//
//  Created by Brendan on 2021-02-12.
//  Copyright © 2022 Steamclock Software. All rights reserved.
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
