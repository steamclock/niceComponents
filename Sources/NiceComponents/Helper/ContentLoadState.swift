//
//  ContentLoadState.swift
//  
//
//  Created by Brendan on 2021-08-12.
//

import Foundation

public enum ContentLoadState {
    case loading
    case noData
    case hasData
    case error(error: Error)
}
