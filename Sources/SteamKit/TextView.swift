//
//  TextView.swift
//  
//
//  Created by Brendan on 2021-01-13.
//

import SwiftUI

public protocol TextView: View {
    var text: String { get }
    var style: TextStyle { get }
}
