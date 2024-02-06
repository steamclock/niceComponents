//
//  NiceText+Styles.swift
//  NiceComponents
//
//  Created by Brendan on 2024-01-29.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import SwiftUI

public extension NiceTextStyle {
    static var screenTitle: NiceTextStyle {
        Config.current.screenTitleStyle
    }

    static var sectionTitle: NiceTextStyle {
        Config.current.sectionTitleStyle
    }

    static var itemTitle: NiceTextStyle {
        Config.current.itemTitleStyle
    }

    static var body: NiceTextStyle {
        Config.current.bodyTextStyle
    }

    static var detail: NiceTextStyle {
        Config.current.detailTextStyle
    }
}
