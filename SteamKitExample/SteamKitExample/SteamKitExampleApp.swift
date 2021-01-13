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
        var newConfig = SteamKit.Config(
            textFont: Font.system(.title)
        )
        newConfig.bodyText.color = Color.green
        Config.current = newConfig
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
