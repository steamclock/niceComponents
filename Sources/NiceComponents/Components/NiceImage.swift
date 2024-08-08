//
//  NiceImage.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import SwiftUI
import UIKit
import Kingfisher

/// Image View that allows for creating an image through a variety of sources,
/// including bundleString, systemIcon, or URL.
public struct NiceImage: View {
    /// The local image to display
    public let image: Image?

    /// Optional: URL of an image.
    public let url: URL?

    /// Optional: Custom width of the image.
    public let width: CGFloat?

    /// Optional: Custom height of the image.
    public let height: CGFloat?

    /// Optional: Tint color for the image.
    public let tintColor: Color?

    /// The content mode for displaying the image. Defaults to .fill.
    public let contentMode: SwiftUI.ContentMode

    /// Optional: Style of the loading indicator (for URL images).
    public let loadingStyle: UIActivityIndicatorView.Style?

    /// Optional: A fallback image to display in case of an error or while loading.
    public let fallbackImage: UIImage?

    /// The alignment of the image within its frame. Defaults to .center.
    public let imageAlignment: Alignment

    @State private var didErrorWithNoFallback: Bool = false

    /// Create a new image from an asset located in the bundle.
    /// - Parameters:
    ///     - bundleString: The name of the image asset.
    ///     - width: The width of the image. Note that `.infinity` will be converted to `nil` to avoid invalid frame dimensions. Default is `nil`.
    ///     - height: The height of the image. Note that `.infinity` will be converted to `nil` to avoid invalid frame dimensions. Default is `nil`.
    ///     - tintColor: Optional color to tint the image. Default is `nil`.
    ///     - contentMode: Content mode for the image. Default is `.fill`.
    ///     - imageAlignment: Image's frame alignment. Default is `.center`.
    public init(
        _ bundleString: String,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        tintColor: Color? = nil,
        contentMode: SwiftUI.ContentMode = .fill,
        imageAlignment: Alignment = .center
    ) {
        self.init(
            image: Image(bundleString),
            url: nil,
            width: width,
            height: height,
            tintColor: tintColor,
            fallbackImage: nil,
            contentMode: contentMode,
            loadingStyle: nil,
            imageAlignment: imageAlignment
        )
    }

    /// Create a new image from a system icon.
    /// - Parameters:
    ///     - systemIcon: The name of the icon to use.
    ///     - width: The width of the image. Note that `.infinity` will be converted to `nil` to avoid invalid frame dimensions. Default is `nil`.
    ///     - height: The height of the image. Note that `.infinity` will be converted to `nil` to avoid invalid frame dimensions. Default is `nil`.
    ///     - tintColor: Optional color to tint the image. Default is `nil`.
    ///     - contentMode: Content mode for the image. Default is `.fill`.
    ///     - imageAlignment: Image's frame alignment. Default is `.center`.
    public init(
        systemIcon: String,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        tintColor: Color? = nil,
        contentMode: SwiftUI.ContentMode = .fill,
        imageAlignment: Alignment = .center
    ) {
        self.init(
            image: Image(systemName: systemIcon),
            url: nil,
            width: width,
            height: height,
            tintColor: tintColor,
            fallbackImage: nil,
            contentMode: contentMode,
            loadingStyle: nil,
            imageAlignment: imageAlignment
        )
    }

    /// Create a new image from an ImageResource.
    /// - Parameters:
    ///     - resource: The resource to use.
    ///     - width: The width of the image. Note that `.infinity` will be converted to `nil` to avoid invalid frame dimensions. Default is `nil`.
    ///     - height: The height of the image. Note that `.infinity` will be converted to `nil` to avoid invalid frame dimensions. Default is `nil`.
    ///     - tintColor: Optional color to tint the image. Default is `nil`.
    ///     - contentMode: Content mode for the image. Default is `.fill`.
    ///     - imageAlignment: Image's frame alignment. Default is `.center`.
    @available(iOS 17.0, *)
    public init(
        resource: SwiftUI.ImageResource,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        tintColor: Color? = nil,
        contentMode: SwiftUI.ContentMode = .fill,
        imageAlignment: Alignment = .center
    ) {
        self.init(
            image: Image(resource),
            url: nil,
            width: width,
            height: height,
            tintColor: tintColor,
            fallbackImage: nil,
            contentMode: contentMode,
            loadingStyle: nil,
            imageAlignment: imageAlignment
        )
    }

    /// Create a new image from an URL.
    /// Under the hood, we use Kingfisher to fetch and cache the image.
    /// Parameters:
    ///     - url: The URL of the image to fetch.
    ///     - width: The width of the image. Note that `.infinity` will be converted to `nil` to avoid invalid frame dimensions. Default is `nil`.
    ///     - height: The height of the image. Note that `.infinity` will be converted to `nil` to avoid invalid frame dimensions. Default is `nil`.
    ///     - tintColor: Optional color to tint the image. Default is `nil`.
    ///     - fallbackImage: The bundle string for a fallback image to show if something goes wrong. Default is `nil`.
    ///     - contentMode: Content mode for the image. Default is `.fill`.
    ///     - loadingStyle: The UIActivityIndicatorView.Style to use while loading. Default is `nil`.
    ///     - imageAlignment: Image's frame alignment. Default is `.center`.
    public init(
        _ url: URL?,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        tintColor: Color? = nil,
        fallbackImage: String? = nil,
        contentMode: SwiftUI.ContentMode = .fill,
        loadingStyle: UIActivityIndicatorView.Style? = nil,
        imageAlignment: Alignment = .center
    ) {
        self.init(
            image: nil,
            url: url,
            width: width,
            height: height,
            tintColor: tintColor,
            fallbackImage: fallbackImage,
            contentMode: contentMode,
            loadingStyle: loadingStyle,
            imageAlignment: imageAlignment
        )
    }

    private init(
        image: Image?,
        url: URL?,
        width: CGFloat?,
        height: CGFloat?,
        tintColor: Color? = nil,
        fallbackImage: String? = nil,
        contentMode: SwiftUI.ContentMode,
        loadingStyle: UIActivityIndicatorView.Style?,
        imageAlignment: Alignment
    ) {
        self.image = image
        self.url = url
        self.width = width == .infinity ? nil : width
        self.height = height == .infinity ? nil : height
        self.tintColor = tintColor
        self.contentMode = contentMode
        self.loadingStyle = loadingStyle
        self.imageAlignment = imageAlignment

        if let imageName = fallbackImage {
            self.fallbackImage = UIImage(named: imageName)
        } else {
            self.fallbackImage = nil
        }
    }

    public var body: some View {
        if let url = url {
            if didErrorWithNoFallback {
                Color.clear
                    .frame(width: width, height: height, alignment: imageAlignment)
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
                    .frame(width: width, height: height, alignment: imageAlignment)
                    .clipped()
            }
        } else if let image = image {
            image
                .renderingMode(tintColor == nil ? .original : .template)
                .resizable()
                .aspectRatio(contentMode: contentMode)
                .frame(width: width, height: height, alignment: imageAlignment)
                .foregroundColor(tintColor)
                .clipped()
        } else {
            EmptyView()
        }
    }
}

struct NiceImage_Previews: PreviewProvider {
    static var previews: some View {
        NiceImage("gear", width: 44, height: 44)
    }
}
