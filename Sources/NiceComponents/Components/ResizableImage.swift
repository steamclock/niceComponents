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
    public let bundleString: String?
    public let url: URL?
    public let width: CGFloat
    public let height: CGFloat
    public let tintColor: Color?

    public init(_ bundleString: String, width: CGFloat, height: CGFloat, tintColor: Color? = nil) {
        self.bundleString = bundleString
        self.url = nil
        self.height = height
        self.width = width
        self.tintColor = tintColor
    }

    public init(_ url: URL?, width: CGFloat, height: CGFloat, tintColor: Color? = nil) {
        self.bundleString = nil
        self.url = url
        self.height = height
        self.width = width
        self.tintColor = tintColor
    }

    public var body: some View {
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
