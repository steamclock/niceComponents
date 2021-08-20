//
//  StatefulView.swift
//  
//
//  Created by Brendan on 2021-08-12.
//

import SwiftUI

public struct StatefulView: View {
    private var state: ContentLoadState

    public let content: AnyView
    public let errorView: AnyView?
    public let loadingView: AnyView?
    public let noDataView: AnyView?

    public init(_ content: AnyView, state: ContentLoadState, errorView: AnyView? = nil, loadingView: AnyView? = nil, noDataView: AnyView? = nil) {
        self.content = content
        self.state = state
        
        self.errorView = errorView
        self.loadingView = loadingView
        self.noDataView = noDataView
    }

    public var body: some View {
        switch state {
        case .error(let error):
            return errorView ?? AnyView(Text("Error: \(error.localizedDescription)"))
        case .noData:
            return noDataView ?? AnyView(Text("No data"))
        case .loading:
            return AnyView(LoadingView()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            )
        case .hasData:
            return content
        }
    }
}

