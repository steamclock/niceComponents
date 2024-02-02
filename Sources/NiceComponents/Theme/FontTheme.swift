//
//  FontTheme.swift
//  NiceComponents
//
//  Created by Brendan on 2021-03-05.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI
import NiceInit

/// A collection of styling settings for fonts used throughout components.
@NiceInit public struct FontTheme {
    /// The screen title font style to apply.
    public var screenTitle: FontStyle = FontStyle(size: 48, weight: .semibold)

    ///The section title font style to apply.
    public var sectionTitle: FontStyle = FontStyle(size: 34, weight: .semibold)

    ///The item title font style to apply.
    public var itemTitle: FontStyle = FontStyle(size: 20, weight: .semibold)

    ///The body type font style to apply.
    public var body: FontStyle = FontStyle(size: 16)

    ///The body detail type font style to apply.
    public var detail: FontStyle = FontStyle(size: 14)

    ///The button font style to apply.
    public var button: FontStyle = FontStyle(size: 14)
}
