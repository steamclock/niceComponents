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
            ScreenTitle("Screen Title")
            SectionTitle("Section Title")
            ItemTitle("Item Title")
            BodyText("Body Text")
            DetailText("Detail Text")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
