//
//  SampleSignInView.swift
//  NiceComponentsExample
//
//  Created by Brendan on 2021-02-12.
//

import NiceComponents
import SwiftUI

public struct SampleSignInView: View {
    @State private var emailField: String = ""
    @State private var passwordField: String = ""

    public var body: some View {
        VStack(alignment: .leading, spacing: Layout.Spacing.standard) {
            ScreenTitle("Sign In")

            DetailText("Email")
            TextField("", text: $emailField)

            DetailText("Password")
            TextField("", text: $passwordField)

            PrimaryButton("Sign In") {}

            SecondaryButton("Create an Account") {}
            Spacer()
        }.padding(Layout.Spacing.standard)
    }
}
