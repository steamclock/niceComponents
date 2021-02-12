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
        let newConfig = Config(textFontName: "NotoSerif-Regular", titleFontName: "NotoSerif-Bold", themeColors: nil)
        Config.current = newConfig
    }


    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
