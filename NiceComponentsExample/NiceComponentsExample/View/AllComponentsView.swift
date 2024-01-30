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
    @State var emailFieldText = "test@example.com"
    @State var email2FieldText = ""
    @State var nameFieldText = ""
    @State var passwordFieldText = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                VStack(alignment: .leading, spacing: 2) {
                    NiceText("Screen Title", style: .screenTitle)

                    NiceText("Section Title", style: .sectionTitle)

                    NiceText("Item Title", style: .itemTitle)

                    NiceText("Item Title", style: .itemTitle.with(color: .blue))

                    NiceText("Attributed Item Title", style: .itemTitle) { string  in
                        if let range = string.range(of: "Attributed") {
                            string[range].foregroundColor = .red
                            string[range].underlineStyle = .single
                        }
                    }
                }

                NiceDivider()

                VStack(alignment: .leading, spacing: 2) {
                    NiceText("Body Text", style: .body)

                    NiceText("Body Text", style: .customBodyText)

                    Text("Body Text")
                        .niceText(.body)

                    NiceText("Detail Text", style: .detail)
                        .shadow()
                }

                NiceDivider()

                VStack(alignment: .leading, spacing: 2) {
                    NiceTextField(placeholder: "Enter your email", text: $emailFieldText)

                    NiceTextField(placeholder: "Enter your email", text: $email2FieldText)

//                    NiceTextField(
//                        isSecure: true,
//                        placeholder: "Password",
//                        style: NiceButtonStyle(surfaceColor: .clear, onSurfaceColor: .mint),
//                        text: $passwordFieldText
//                    )
//
//                    NiceTextField(
//                        placeholder: "Name",
//                        placeholderStyle: NiceTextStyle(color: .blue, fontStyle: Config.current.bodyTextStyle.fontStyle),
//                        style: NiceButtonStyle(surfaceColor: .clear, onSurfaceColor: .black),
//                        text: $nameFieldText
//                    )

                }

                NiceDivider()

                VStack(alignment: .leading, spacing: 2) {
                    PrimaryButton("Primary Button") { }
                    SecondaryButton("Secondary Button") { }
                    BorderlessButton("Borderless Button") { }
                    DestructiveButton("Destructive Button") { }
                }

                NiceDivider()

                NiceImage(
                    URL(string: "https://placekitten.com/200/300"),
                    width: 200,
                    height: 300
                )

                NiceImage(
                    URL(string: "https://placekitten.com/100/150"),
                    height: 200,
                    contentMode: .fill
                )

                NiceImage(
                    URL(string: "https://placekitten.com/100/150"),
                    height: 200,
                    contentMode: .fit
                )

                VStack {
                    NiceImage(URL(string: "https://placekitten.com/100/150"))
                }.background(Color.red)
                .frame(width: 200, height: 200)
            }
        }.padding(NiceSpacing.standard)
    }
}
