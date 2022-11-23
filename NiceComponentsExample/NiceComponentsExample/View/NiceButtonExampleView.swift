//
//  NiceButtonExampleView.swift
//
//  Created by Alejandro Zielinsky on 2022-07-18.
//

import NiceComponents
import SwiftUI

struct NiceButtonExampleView: View {

    var body: some View {
        ScrollView {

                VStack(alignment: .center, spacing: 8) {

                    PrimaryButton("Primary") {
                        print("Tapped")
                    }.withRightImage(
                        NiceImage(systemIcon: "heart.fill", width: 14, height: 14, tintColor: .red)
                    )

                    PrimaryButton("Bigger Primary", height: 56) { }

                    PrimaryButton("Inactive Primary", inactive: true) { }

                    PrimaryButton(
                        "Like Button",
                        surfaceColor: .white,
                        border: .rounded(
                            color: .black,
                            cornerRadius: 4,
                            width: 1.5
                        )
                    ) { }.withRightImage(
                        NiceImage(systemIcon: "heart.fill", width: 14, height: 14, tintColor: .red)
                    )

                    SecondaryButton("Left Image Button") { }.withLeftImage(
                        NiceImage(systemIcon: "pencil", width: 14, height: 14, tintColor: .black)
                    )

                    BorderlessButton("Borderless Button") { }

                    BorderlessButton("Stroked Button", border: .stroke(strokeStyle: StrokeStyle(lineWidth: 1.5, lineCap: .round, lineJoin: .round, dash: [8]))) { }
                }
            }.padding(Layout.Spacing.standard)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Nice Button Examples")
    }
}
