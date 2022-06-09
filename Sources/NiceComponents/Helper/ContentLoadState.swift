//
//  ContentLoadState.swift
//  
//
//  Created by Brendan on 2021-08-12.
//

import Foundation

public enum ContentLoadState: Equatable {
    case loading
    case noData
    case hasData
    case error(error: Error)

    public static func == (lhs: ContentLoadState, rhs: ContentLoadState) -> Bool {
        switch lhs {
        case .loading:
            if case .loading = rhs { return true }
        case .noData:
            if case .noData = rhs { return true }
        case .hasData:
            if case .hasData = rhs { return true }
        case .error(let error):
            if case .error(let rhsError) = rhs {
                return error.localizedDescription == rhsError.localizedDescription
            }
        }
        return false
    }
}
