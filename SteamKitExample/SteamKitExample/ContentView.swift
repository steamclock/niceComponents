//
//  ContentView.swift
//  SteamKitExample
//
//  Created by Brendan on 2021-01-13.
//

import SteamKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ItemTitle("Hi mom")
            BodyText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit ess")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
