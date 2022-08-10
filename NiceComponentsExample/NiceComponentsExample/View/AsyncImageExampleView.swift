//
//  AsyncImageExampleView.swift
//  NiceComponentsExample
//
//  Created by Alejandro Zielinsky on 2022-08-10.
//

import NiceComponents
import SwiftUI

struct AsyncImageExampleView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: Layout.Spacing.medium) {
                VStack {
                    BodyText("Loading Image...")
                    ResizableImage(URL(string: "https://placekitten.com/200/300"), maxWidth: 200, maxHeight: 300)
                }
                VStack {
                    BodyText("Loading image icon with color placeholder")
                    ResizableImage(URL(string: "https://placekitten.com/48/48"), maxWidth: 60, maxHeight: 60) {
                        Color(
                            red: .random(in: 0...1),
                            green: .random(in: 0...1),
                            blue: .random(in: 0...1)
                        )
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(Layout.Spacing.standard)
    }
}
