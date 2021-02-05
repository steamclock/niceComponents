//
//  ContentView.swift
//  NiceComponentsExample
//
//  Created by Brendan on 2021-01-29.
//

import NiceComponents
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            VStack(alignment: .leading, spacing: 2) {
                ScreenTitle("Screen Title")
                SectionTitle("Section Title")
                ItemTitle("Item Title")
            }

            VStack(alignment: .leading, spacing: 2) {
                BodyText("Body Text")
                DetailText("Detail Text")
            }

            VStack(alignment: .leading, spacing: 2) {
                PrimaryButton("Primary Button") { }
                SecondaryButton("Secondary Button") { }
                InactiveButton("Inactive Button") { }
                DestructiveButton("Destructive Button") { }
            }
        }.padding(Layout.Padding.standard)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
