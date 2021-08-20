//
//  StatefulExampleView.swift
//  NiceComponentsExample
//
//  Created by Brendan on 2021-08-19.
//

import NiceComponents
import SwiftUI

class StatefulViewModel: ObservableObject {
    @Published var state: ContentLoadState = .noData
}

struct StatefulExampleView: View {
    @ObservedObject var viewModel: StatefulViewModel

    var body: some View {
        StatefulView(
            AnyView(Text("Here's some state!")),
            state: viewModel.state
        ).onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                viewModel.state = .loading

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    viewModel.state = .hasData
                }
            }
        }
    }
}
