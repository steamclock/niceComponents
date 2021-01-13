//
//  SteamKitExampleApp.swift
//  SteamKitExample
//
//  Created by Brendan on 2021-01-13.
//

import SteamKit
import SwiftUI

@main
struct SteamKitExampleApp: App {
    init() {
        print("--- init")
        var newConfig = SteamKit.Config()
        newConfig.bodyText = FontStyle(color: Color.green, size: 16)
        Config.current = newConfig
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
