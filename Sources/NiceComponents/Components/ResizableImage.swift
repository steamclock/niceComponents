//
//  ResizableImage.swift
//  
//
//  Created by Brendan on 2021-03-12.
//

import SwiftUI
import UIKit
import Kingfisher

public struct ResizableImage: View {
    let url: URL?
    let width: CGFloat?
    let height: CGFloat?

    public init(_ url: URL?, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.url = url
        self.width = width
        self.height = height
    }

    public var body: some View {
        KFImage(url)
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipped()
    }
}
