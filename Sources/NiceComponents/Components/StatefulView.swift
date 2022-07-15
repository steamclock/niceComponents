//
//  StatefulView.swift
//  
//
//  Created by Brendan on 2021-08-12.
//

import SwiftUI

public struct StatefulView<AnyHasDataView: View, AnyErrorView: View, AnyLoadingView: View, AnyNoDataView: View>: View {
    private var state: ContentLoadState

    public let hasDataView: () -> AnyHasDataView
    public let errorView: (Error) -> AnyErrorView
    public let loadingView: () -> AnyLoadingView
    public let noDataView: () -> AnyNoDataView

    public init(
            state: ContentLoadState,
            @ViewBuilder hasDataView: @escaping () -> AnyHasDataView,
            @ViewBuilder errorView: @escaping (Error) -> AnyErrorView,
            @ViewBuilder loadingView: @escaping () -> AnyLoadingView,
            @ViewBuilder noDataView: @escaping () -> AnyNoDataView) {
        self.state = state
        self.hasDataView = hasDataView
        self.errorView = errorView
        self.loadingView = loadingView
        self.noDataView = noDataView
    }

    public var body: some View {
        Group {
            switch state {
            case .hasData: hasDataView()
            case .error(let error): errorView(error)
            case .loading: loadingView()
            case .noData: noDataView()
            }
        }
    }
}

public extension StatefulView where AnyErrorView == ErrorView, AnyLoadingView == LoadingView<EmptyView>, AnyNoDataView == NoDataView {
    init(
        state: ContentLoadState,
        @ViewBuilder hasDataView: @escaping () -> AnyHasDataView) {
            self.init(
                state: state,
                hasDataView: hasDataView,
                errorView: { ErrorView(error: $0) },
                loadingView: { LoadingView() },
                noDataView: { NoDataView() }
            )
    }
}

public extension StatefulView where AnyErrorView == ErrorView, AnyLoadingView == LoadingView<EmptyView> {
    init(
        state: ContentLoadState,
        @ViewBuilder hasDataView: @escaping () -> AnyHasDataView,
        @ViewBuilder noDataView: @escaping () -> AnyNoDataView) {
            self.init(
                state: state,
                hasDataView: hasDataView,
                errorView: { ErrorView(error: $0) },
                loadingView: { LoadingView() },
                noDataView: noDataView
            )
    }
}

public extension StatefulView where AnyErrorView == ErrorView, AnyNoDataView == NoDataView {
    init(
            state: ContentLoadState,
            @ViewBuilder hasDataView: @escaping () -> AnyHasDataView,
            @ViewBuilder loadingView: @escaping () -> AnyLoadingView) {
        self.init(
            state: state,
            hasDataView: hasDataView,
            errorView: { ErrorView(error: $0) },
            loadingView: loadingView,
            noDataView: { NoDataView() }
        )
    }
}

public extension StatefulView where AnyLoadingView == LoadingView<EmptyView>, AnyNoDataView == NoDataView {
    init(
        state: ContentLoadState,
        @ViewBuilder hasDataView: @escaping () -> AnyHasDataView,
        @ViewBuilder errorView: @escaping (Error) -> AnyErrorView) {
            self.init(
                state: state,
                hasDataView: hasDataView,
                errorView: errorView,
                loadingView: { LoadingView() },
                noDataView: { NoDataView() }
            )
    }
}

public extension StatefulView where AnyErrorView == ErrorView {
    init(
        state: ContentLoadState,
        @ViewBuilder hasDataView: @escaping () -> AnyHasDataView,
        @ViewBuilder loadingView: @escaping () -> AnyLoadingView,
        @ViewBuilder noDataView: @escaping () -> AnyNoDataView) {
            self.init(
                state: state,
                hasDataView: hasDataView,
                errorView: { ErrorView(error: $0) },
                loadingView: loadingView,
                noDataView: noDataView
            )
    }
}

public extension StatefulView where AnyLoadingView == LoadingView<EmptyView> {
    init(
        state: ContentLoadState,
        @ViewBuilder hasDataView: @escaping () -> AnyHasDataView,
        @ViewBuilder errorView: @escaping (Error) -> AnyErrorView,
        @ViewBuilder noDataView: @escaping () -> AnyNoDataView) {
            self.init(
                state: state,
                hasDataView: hasDataView,
                errorView: errorView,
                loadingView: { LoadingView() },
                noDataView: noDataView
            )
    }
}

public extension StatefulView where AnyNoDataView == NoDataView {
    init(
        state: ContentLoadState,
        @ViewBuilder hasDataView: @escaping () -> AnyHasDataView,
        @ViewBuilder errorView: @escaping (Error) -> AnyErrorView,
        @ViewBuilder loadingView: @escaping () -> AnyLoadingView) {
            self.init(
                state: state,
                hasDataView: hasDataView,
                errorView: errorView,
                loadingView: loadingView,
                noDataView: { NoDataView() }
            )
    }
}
