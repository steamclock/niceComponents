//
//  ContentView.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
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
                NavigationLink(destination: CustomizingComponentsView()) {
                    Text("Customizing Components")
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
