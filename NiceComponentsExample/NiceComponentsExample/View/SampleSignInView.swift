//
//  SampleSignInView.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import NiceComponents
import SwiftUI

public struct SampleSignInView: View {
    @State private var emailField: String = ""
    @State private var passwordField: String = ""

    public var body: some View {
        VStack(alignment: .leading, spacing: NiceSpacing.standard) {
            NiceText("Sign In", style: .screenTitle)

            NiceText("Email", style: .detail)
            TextField("", text: $emailField)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            NiceText("Password", style: .detail)
            TextField("", text: $passwordField)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            NiceButton("Sign In", style: .primary) {}

            NiceButton("Create an Account", style: .secondary) {}

            Spacer()
        }.padding(NiceSpacing.standard)
    }
}
