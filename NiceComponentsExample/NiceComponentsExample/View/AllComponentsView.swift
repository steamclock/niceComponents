//
//  AllComponentsView.swift
//  NiceComponentsExample
//
//  Created by Brendan on 2021-02-12.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import NiceComponents
import SwiftUI

struct AllComponentsView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                VStack(alignment: .leading, spacing: 2) {
                    ScreenTitle("Screen Title", dynamicMaxSize: .xxxLarge)
                    SectionTitle("Section Title")
                    ItemTitle("Item Title")
                    ItemTitle("Attributed Item Title", dynamicMaxSize: .xxxLarge) { string  in
                        if let range = string.range(of: "Attributed") {
                            string[range].foregroundColor = .red
                            string[range].underlineStyle = .single
                        }
                    }
                }

                NiceDivider()

                VStack(alignment: .leading, spacing: 2) {
                    BodyText("Body Text")
                    DetailText("Detail Text")
                }

                NiceDivider()

                VStack(alignment: .leading, spacing: 2) {
                    PrimaryButton("Primary Button") { }
                    SecondaryButton("Secondary Button") { }
                    BorderlessButton("Borderless Button") { }
                    DestructiveButton("Destructive Button") { }
                }

                NiceDivider()

                NiceImage(URL(string: "https://placekitten.com/200/300"), width: 200, height: 300)
            }
        }.padding(NiceSpacing.standard)
    }
}
