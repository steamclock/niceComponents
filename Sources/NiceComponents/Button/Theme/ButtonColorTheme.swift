//
//  ButtonColorTheme.swift
//
//
//  Created by Brendan Lensink on 2024-02-05.
//

import SwiftUI

public protocol ButtonColorTheme {
    var surface: Color { get }
    var onSurface: Color { get }
    var inactiveSurface: Color { get }
    var inactiveOnSurface: Color { get }
}
