//
//  View+If.swift
//  
//
//  Created by Brendan on 2022-08-12.
//

import SwiftUI

// https://stackoverflow.com/a/62962375
public extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder func iflet<Content: View, T>(_ conditional: Optional<T>, @ViewBuilder _ content: (Self, _ value: T) -> Content) -> some View {
        if let value = conditional {
            content(self, value)
        } else {
            self
        }
    }
}

