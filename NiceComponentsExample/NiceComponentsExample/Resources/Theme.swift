//
//  Theme.swift
//  NiceComponentsExample
//
//  Created by Brendan on 2021-09-02.
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
