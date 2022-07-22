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
        VStack {
            StatefulView(
                state: viewModel.state,
                hasDataView: { content },
                errorView: { ErrorView(error: $0) },
                loadingView: { LoadingView() },
                noDataView: { NoDataView() }
            )

            StatefulView(
                state: viewModel.state,
                hasDataView: { content },
                loadingView: { Text("Loading") },
                noDataView: { Text("No Data :(") }
            )

            StatefulView(
                state: viewModel.state,
                hasDataView: { content },
                errorView: { Text("Error: \($0.localizedDescription)") },
                noDataView: { Text("No Data") }
            )

            StatefulView(
                state: viewModel.state,
                hasDataView: { content },
                errorView: { Text("Error: \($0.localizedDescription)") },
                loadingView: { Text("Loading...") }
            )

            StatefulView(
                state: viewModel.state,
                hasDataView: { content },
                errorView: { Text("Error: \($0.localizedDescription)") }
            )

            StatefulView(
                state: viewModel.state,
                hasDataView: { content },
                loadingView: { Text("Loading...") }
            )

            StatefulView(
                state: viewModel.state,
                hasDataView: { content },
                noDataView: { Text("No data :(") }
            )

            StatefulView(
                state: viewModel.state,
                hasDataView: { content }
            )
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               viewModel.state = .loading

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    viewModel.state = .hasData
                }
            }
        }
    }

    var content: some View {
        VStack {
            Text("Here's some state!")
        }
    }
}
