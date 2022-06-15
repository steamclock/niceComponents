//
//  ResizableImage.swift
//  
//
//  Created by Brendan on 2021-03-12.
//

import SwiftUI
import UIKit
import Kingfisher

struct ResizableImage: View {
    let bundleString: String?
    let url: URL?
    let width: CGFloat
    let height: CGFloat
    let tintColor: Color?

    init(_ bundleString: String, width: CGFloat, height: CGFloat, tintColor: Color? = nil) {
        self.bundleString = bundleString
        self.url = nil
        self.height = height
        self.width = width
        self.tintColor = tintColor
    }

    init(_ url: URL?, width: CGFloat, height: CGFloat, tintColor: Color? = nil) {
        self.bundleString = nil
        self.url = url
        self.height = height
        self.width = width
        self.tintColor = tintColor
    }

    var body: some View {
        if let url = url {
            KFImage(url)
                .renderingMode(tintColor == nil ? .original : .template)
                .resizable()
                .foregroundColor(tintColor)
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
        } else if let string = bundleString {
            Image(string)
                .renderingMode(tintColor == nil ? .original : .template)
                .resizable()
                .foregroundColor(tintColor)
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
        } else {
            EmptyView()
        }
    }
}
