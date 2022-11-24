//
//  NiceImage.swift
//  NiceComponents
//
//  Created by Brendan on 2021-03-12.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI
import UIKit
import Kingfisher

/// Image View that allows for creating an image through a variety of sources, including bundleString, systemIcon or URL.
public struct NiceImage: View {
    public let bundleString: String?
    public let systemIcon: String?
    public let url: URL?
    public let width: CGFloat
    public let height: CGFloat
    public let tintColor: Color?
    public let contentMode: SwiftUI.ContentMode
    public let loadingStyle: UIActivityIndicatorView.Style?
    public let fallbackImage: UIImage?

    @State private var didErrorWithNoFallback: Bool = false

    /**
     * Create a new image from an asset located in the bundle.
     *
     * - Parameters:
     *      - bundleString: The name of the image asset.
     *      - width: The width of the image.
     *      - height: The height of the image.
     *      - tintColor: Optional color to tint the image. Default is `nil`.
     *      - contentMode: Content mode for the image. Default is `.fill`.
     */
    public init(
        _ bundleString: String,
        width: CGFloat,
        height: CGFloat,
        tintColor: Color? = nil,
        contentMode: SwiftUI.ContentMode = .fill
    ) {
        self.bundleString = bundleString
        self.url = nil
        self.systemIcon = nil
        self.height = height
        self.width = width
        self.contentMode = contentMode
        self.tintColor = tintColor
        self.loadingStyle = nil
        self.fallbackImage = nil
    }

    /**
     * Create a new image from a system icon.
     *
     * - Parameters:
     *      - systemIcon: The name of the icon to use.
     *      - width: The width of the image.
     *      - height: The height of the image.
     *      - tintColor: Optional color to tint the image. Default is `nil`.
     *      - contentMode: Content mode for the image. Default is `.fill`.
     */
    public init(
        systemIcon: String,
        width: CGFloat,
        height: CGFloat,
        tintColor: Color? = nil,
        contentMode: SwiftUI.ContentMode = .fill
    ) {
        self.bundleString = nil
        self.url = nil
        self.systemIcon = systemIcon
        self.height = height
        self.width = width
        self.contentMode = contentMode
        self.tintColor = tintColor
        self.loadingStyle = nil
        self.fallbackImage = nil
    }

    /**
     * Create a new image from an URL.
     * Under the hood, we use Kingfisher to fetch and cache the image.
     *
     * - Parameters:
     *      - url: The URL of the image to fetch.
     *      - width: The width of the image.
     *      - height: The height of the image.
     *      - tintColor: Optional color to tint the image. Default is `nil`.
     *      - fallbackImage: The bundle string for a fallback image to show if something goes wrong. Default is `nil`.
     *      - contentMode: Content mode for the image. Default is `.fill`.
     *      - loadingStyle: The UIActivityIndicatorView.Style to use while loading. Default is `nil`.
     */
    public init(
        _ url: URL?,
        width: CGFloat,
        height: CGFloat,
        tintColor: Color? = nil,
        fallbackImage: String? = nil,
        contentMode: SwiftUI.ContentMode = .fill,
        loadingStyle: UIActivityIndicatorView.Style? = nil
    ) {
        self.bundleString = nil
        self.systemIcon = nil
        self.url = url
        self.height = height
        self.width = width
        self.contentMode = contentMode
        self.tintColor = tintColor
        self.loadingStyle = loadingStyle
        if let imageName = fallbackImage {
            self.fallbackImage = UIImage(named: imageName)
        } else {
            self.fallbackImage = nil
        }
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
            if didErrorWithNoFallback {
                Color.clear
                    .frame(width: width, height: height)
            } else {
                KFImage(url)
                    .renderingMode(tintColor == nil ? .original : .template)
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .onFailure { _ in
                        if fallbackImage == nil {
                            didErrorWithNoFallback = true
                        }
                    }
                    .onFailureImage(fallbackImage)
                    .foregroundColor(tintColor)
                    .aspectRatio(contentMode: contentMode)
                    .frame(width: width, height: height)
                    .clipped()
            }
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
