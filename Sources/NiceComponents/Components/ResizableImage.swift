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
    public let systemIcon: String?
    public let url: URL?
    public let width: CGFloat
    public let height: CGFloat
    public let tintColor: Color?
    public let contentMode: SwiftUI.ContentMode
    public let loadingStyle: UIActivityIndicatorView.Style?

    public init(_ bundleString: String, width: CGFloat, height: CGFloat, tintColor: Color? = nil, contentMode: SwiftUI.ContentMode = .fit, loadingStyle: UIActivityIndicatorView.Style? = nil) {
        self.bundleString = bundleString
        self.url = nil
        self.systemIcon = nil
        self.height = height
        self.width = width
        self.contentMode = contentMode
        self.tintColor = tintColor
        self.loadingStyle = loadingStyle
    }

    public init(systemIcon: String, width: CGFloat, height: CGFloat, tintColor: Color? = nil, contentMode: SwiftUI.ContentMode = .fit) {
        self.bundleString = nil
        self.url = nil
        self.systemIcon = systemIcon
        self.height = height
        self.width = width
        self.contentMode = contentMode
        self.tintColor = tintColor
        self.loadingStyle = nil
    }

    public init(_ url: URL?, width: CGFloat, height: CGFloat, tintColor: Color? = nil, contentMode: SwiftUI.ContentMode = .fit) {
        self.bundleString = nil
        self.systemIcon = nil
        self.url = url
        self.height = height
        self.width = width
        self.contentMode = contentMode
        self.tintColor = tintColor
        self.loadingStyle = nil
    }

    private var image: Image? {
        if let string = bundleString {
            return Image(string)
        } else if let icon = systemIcon {
            return Image(systemName: icon)
        }
        return nil
    }

    public var body: some View {
        if let url = url {
            KFImage(url)
                .renderingMode(tintColor == nil ? .original : .template)
                .resizable()
                .placeholder {
                    LoadingView(loadingStyle ?? .large)
                }
                .foregroundColor(tintColor)
                .aspectRatio(contentMode: contentMode)
                .frame(width: width, height: height)
                .clipped()
        } else if let image = image {
            image
                .renderingMode(tintColor == nil ? .original : .template)
                .resizable()
                .aspectRatio(contentMode: contentMode)
                .frame(width: width, height: height)
                .foregroundColor(tintColor)
                .clipped()
        } else {
            EmptyView()
        }
    }
}
