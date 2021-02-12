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
