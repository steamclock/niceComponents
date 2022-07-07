//
//  AllComponentsView.swift
//  
//
//  Created by Brendan on 2021-02-12.
//

import NiceComponents
import SwiftUI

struct AllComponentsView: View {
    @State private var isLoading = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                VStack(alignment: .leading, spacing: 2) {
                    ScreenTitle("Screen Title")
                    SectionTitle("Section Title")
                    ItemTitle("Item Title")
                    ItemTitle("Attributed Item Title") { string  in
                        if let range = string.range(of: "Attributed") {
                            string[range].foregroundColor = .red
                            string[range].underlineStyle = .single
                            string[range].font = .custom(Config.current.detailTextStyle)
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
                    InactiveButton("Inactive Button")
                    DestructiveButton("Destructive Button") { }
                }

                ThemedDivider()

                HStack {
                    Spacer()

                    LoadingView()

                    Spacer()
                }
            }
        }.padding(Layout.Spacing.standard)
    }
}
