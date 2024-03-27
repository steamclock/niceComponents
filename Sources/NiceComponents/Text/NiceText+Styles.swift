//
//  NiceText+Styles.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
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
