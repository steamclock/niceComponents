//
//  ContentView.swift
//  NiceComponentsExample
//
//  Created by Brendan on 2021-01-29.
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
                NavigationLink(destination: AsyncImageExampleView()) {
                    Text("Async Image Example")
                }
                NavigationLink(destination: SampleSignInView()) {
                    Text("Sign In")
                }
                NavigationLink(destination: StatefulExampleView(viewModel: StatefulViewModel())) {
                    Text("Stateful View Example")
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
