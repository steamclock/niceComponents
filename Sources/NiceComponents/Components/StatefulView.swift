//
//  StatefulView.swift
//  
//
//  Created by Brendan on 2021-08-12.
//

import SwiftUI

public struct StatefulView: View {
    @Binding public var state: ContentLoadState

    public let content: AnyView

    public var body: some View {
        switch state {
        case .noData:
            return AnyView(Text("no data"))
        case .error(let error):
            return AnyView(Text("Error"))
        case .loading:
            AnyView(LoadingView()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            )
        case .hasData:
            return content
        }

        return AnyView(EmptyView())
    }
}

