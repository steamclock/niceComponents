//
//  Theme.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import NiceComponents
import SwiftUI

enum Theme {
    static var config: Config {
        var newConfig = Config(
            colorTheme: NiceColorTheme()
                .with(
                    primary: Color(hex: "FFA71A")
                )
        )

        newConfig.bodyTextStyle = NiceTextStyle(
            color: Color(hex: "FFA71A"),
            size: 16
        )

        return newConfig
    }
}

extension NiceTextStyle {
    static var bodyBold: NiceTextStyle {
        Config.current.bodyTextStyle
            .with(weight: .bold)
    }
}
