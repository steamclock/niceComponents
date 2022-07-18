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
                    ScreenTitle("Screen Title")
                    SectionTitle("Section Title")
                    ItemTitle("Item Title")
                }

                ThemedDivider()

                VStack(alignment: .leading, spacing: 2) {
                    BodyText("Body Text")
                    DetailText("Detail Text")
                }

                ThemedDivider()

                VStack(alignment: .center, spacing: 8) {
                    PrimaryButton("Primary Button") { }
                    SecondaryButton("Secondary Button") { }
                    BorderlessButton("Borderless Button") { }
                    DestructiveButton("Destructive Button") { }
                }

                ThemedDivider()

                LoadingView()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                LoadingView(typeStyle: TypeStyle(color: .gray, theme: .init(size: 12)),indicatorStyle: .medium)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }.padding(Layout.Spacing.standard)
    }
}
