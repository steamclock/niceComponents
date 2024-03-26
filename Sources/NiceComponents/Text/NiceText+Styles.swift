//
//  NiceText+Styles.swift
//  NiceComponents
//
//  Created by Brendan on 2024-01-29.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import SwiftUI

public extension NiceTextStyle {
    /// The text style for screen titles.
    static var screenTitle: NiceTextStyle {
        Config.current.screenTitleStyle
    }

    /// The text style for section titles.
    static var sectionTitle: NiceTextStyle {
        Config.current.sectionTitleStyle
    }

    /// The text style for item titles.
    static var itemTitle: NiceTextStyle {
        Config.current.itemTitleStyle
    }

    /// The text style for body text.
    static var body: NiceTextStyle {
        Config.current.bodyTextStyle
    }

    /// The text style for detailed text.
    static var detail: NiceTextStyle {
        Config.current.detailTextStyle
    }
}
