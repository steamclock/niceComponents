//
//  AllComponentsView.swift
//  
//
//  Created by Brendan on 2021-02-12.
//

import NiceComponents
import SwiftUI

struct AllComponentsView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                VStack(alignment: .leading, spacing: 2) {
                    ScreenTitle("Screen Title", dynamicMaxSize: 90)
                    SectionTitle("Section Title")
                    ItemTitle("Item Title")
                    ItemTitle("Attributed Item Title", dynamicMaxSize: 32) { string  in
                        if let range = string.range(of: "Attributed") {
                            string[range].foregroundColor = .red
                            string[range].underlineStyle = .single
                            string[range].font = .scaledFont(name: Config.current.detailTextStyle.theme.name, size: Config.current.detailTextStyle.theme.size, maxSize: 32)
                        }
                    }
                }

                ThemedDivider()

                VStack(alignment: .leading, spacing: 2) {
                    BodyText("Body Text")
                    DetailText("Detail Text")
                }

                ThemedDivider()

                VStack(alignment: .leading, spacing: 2) {
                    PrimaryButton("Primary Button") { }
                    SecondaryButton("Secondary Button") { }
                    BorderlessButton("Borderless Button") { }
                    DestructiveButton("Destructive Button") { }
                }

                ThemedDivider()

                HStack {
                    Spacer()

                    LoadingView()

                    Spacer()
                }

                ResizableImage(URL(string: "https://placekitten.com/200/300"), width: 200, height: 300)
            }
        }.padding(Layout.Spacing.standard)
    }
}
