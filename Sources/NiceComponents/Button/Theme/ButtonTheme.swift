//
//  ButtonTheme.swift
//
//
//  Created by Brendan Lensink on 2024-02-05.
//

import SwiftUI

public protocol ButtonTheme {
    var textStyle: TextTheme { get }
    var height: CGFloat { get }
    var colorStyle: ButtonColorTheme { get }
    var border: BorderStyle { get }
}
