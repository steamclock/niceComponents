//
//  NiceButtonImage.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-30.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import SwiftUI

public struct NiceButtonImage {
    let image: NiceImage
    let offset: CGFloat

    init(image: NiceImage, offset: CGFloat = 0) {
        self.image = image
        self.offset = offset
    }
}
