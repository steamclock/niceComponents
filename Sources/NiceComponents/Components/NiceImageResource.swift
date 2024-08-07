//
//  NiceImageResource.swift
//
//
//  Created by Brendan Lensink on 2024-08-07.
//

import SwiftUI

@available(iOS 17.0, *)
public struct NiceImageResource: View {
    /// Optional: Reference to a color resource
    public let colorResource: SwiftUI.ColorResource?

    /// Optional: Reference to an image resource.
    public let imageResource: SwiftUI.ImageResource?

    public var body: some View {
        if let colorResource {
            Image(colorResource)
        } else {

        }
        Image()
    }
}
