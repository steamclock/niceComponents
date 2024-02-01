//
//  SampleSignInView.swift
//  NiceComponentsExample
//
//  Created by Brendan on 2021-02-12.
//  Copyright © 2022 Steamclock Software. All rights reserved.
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
//            PrimaryButton("Sign In") {}
//
//            SecondaryButton("Create an Account") {}
            Spacer()
        }.padding(NiceSpacing.standard)
    }
}
