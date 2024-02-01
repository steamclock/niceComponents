//
//  ContentView.swift
//  NiceComponentsExample
//
//  Created by Brendan on 2021-02-12.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import NiceComponents
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: AllComponentsView()) {
                    Text("All Components")
                }
                NavigationLink(destination: NiceButtonExampleView()) {
                    Text("Nice Button")
                }
                NavigationLink(destination: SampleSignInView()) {
                    Text("Sign In")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// TODO: this needs to change to first declare CustomTextStyle: TextTheme
//extension NiceTextStyle {
//    static var customBodyText = NiceTextStyle(
//        fontTheme: FontTheme("Impact", size: 16),
//        textTheme: TextTheme(color: .green)
//    )
//}
