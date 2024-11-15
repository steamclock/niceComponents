//
//  CustomizingComponentsView.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import NiceComponents
import SwiftUI

struct CustomizingComponentsView: View {
    @State var emailFieldText = "test@example.com"
    @State var email2FieldText = ""
    @State var nameFieldText = ""
    @State var passwordFieldText = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: NiceSpacing.small) {
                VStack(alignment: .leading, spacing: NiceSpacing.xSmall) {

                    NiceText("Use a default style", style: .body)

                    NiceText("Customize it with `with`", style: .body.with(weight: .semibold))

                    Text("Use a view modifier")
                        .niceText(.itemTitle)

                    NiceText("Style attributed text", style: .body) { string  in
                        if let range = string.range(of: "attributed") {
                            string[range].foregroundColor = .red
                            string[range].underlineStyle = .single
                        }
                    }

                    NiceText("Or make your own resusable style", style: .customBodyText)

                    NiceText(
                        "Or make it inline",
                        style: NiceTextStyle(
                            color: .green,
                            font: "Impact"
                        )
                    )

                    NiceText("maybe even add a Nice little shadow", style: .body)
                        .shadow()
                }

                NiceDivider()

                VStack(alignment: .leading, spacing: 2) {
                    NiceButton("Buttons too!", style: .primary) {}

                    NiceButton("Buttons too!", style: .primary.with(surface: .red)) {}

                    NiceButton("System icons on the left", style: .secondary, leftImage: NiceButtonImage(systemIcon: "heart.fill")) {}

                    NiceButton("And the right", style: .secondary, rightImage: NiceButtonImage(systemIcon: "heart")) {}

                    NiceButton("Smaller ones too", style: .secondary, leftImage: NiceButtonImage(systemIcon: "heart.fill", offset: 8), horizontalContentPadding: 20) {}

                    NiceButton("Over here as well", style: .secondary, rightImage: NiceButtonImage(systemIcon: "heart"), horizontalContentPadding: 20) {}


                    NiceButton("and buttons with images", style: .primary, balanceImages: false) {}
                        .withLeftImage(
                            NiceImage(systemIcon: "fireworks", width: 25, height: 25),
                            offset: 25
                        )

                    NiceButton("and images that don't offset your text", style: .primary) {}
                        .withLeftImage(
                            NiceImage(systemIcon: "fireworks", width: 25, height: 25),
                            offset: 25
                        )

                    NiceButton(
                        "or fun premade borders",
                        style: .primary.with(
                            border: .capsule(color: .black, width: 2)
                        )
                    ) {}

                    NiceButton(
                        "or go full custom",
                        style: .primary.with(
                            height: 55,
                            border: .stroke(strokeStyle: StrokeStyle(lineWidth: 1, lineCap: .butt, lineJoin: .bevel, miterLimit: 1, dash: [CGFloat](), dashPhase: 1))
                        )
                    ) {}
                }

                NiceDivider()

            }
        }.padding(NiceSpacing.standard)
    }
}


extension NiceTextStyle {
    static var customBodyText = NiceTextStyle(color: .orange)
}
