//
//  NiceText+Styles.swift
//  NiceComponents
//
//  Created by Brendan on 2024-01-29.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import SwiftUI

public extension TextTheme {
    static var screenTitle: TextTheme {
        Config.current.screenTitleStyle
    }

    static var sectionTitle: TextTheme {
        Config.current.sectionTitleStyle
    }

    static var itemTitle: TextTheme {
        Config.current.itemTitleStyle
    }

    static var body: TextTheme {
        Config.current.bodyTextStyle
    }

    static var detail: TextTheme {
        Config.current.detailTextStyle
    }
}
