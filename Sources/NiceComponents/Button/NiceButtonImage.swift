//
//  NiceButtonImage.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import SwiftUI

/// A struct that encapsulates the image and its offset used in a `NiceButton`.
public struct NiceButtonImage {
    /// The image to be displayed within a button.
    let image: NiceImage

    /// The horizontal offset for the image within the button.
    let offset: CGFloat

    /// Initializes a `NiceButtonImage` with the specified image and offset.
    /// - Parameters:
    ///   - image: The `NiceImage` to be displayed.
    ///   - offset: The horizontal offset for the image. Defaults to 8.
    public init(_ image: NiceImage, offset: CGFloat = 8) {
        self.image = image
        self.offset = offset
    }

    /// Initializes a `NiceButtonImage` with an image from a bundle.
    /// - Parameters:
    ///   - bundleString: The string identifier for the image in the bundle.
    ///   - width: Width for the icon. Default is 16.
    ///   - height: Height for the icon. Default is 14.
    ///   - tintColor: The tint color to apply to the image. Optional.
    ///   - contentMode: The mode that determines how the UI fits the image within its bounds. Defaults to `.fill`.
    ///   - imageAlignment: The alignment of the image within its frame. Defaults to `.center`.
    ///   - offset: The horizontal offset for the image. Defaults to 8.
    public init(_ bundleString: String,
                width: CGFloat = 16,
                height: CGFloat = 14,
                tintColor: Color? = nil,
                contentMode: SwiftUI.ContentMode = .fill,
                imageAlignment: Alignment = .center,
                offset: CGFloat = 8
    ) {
        self.init(NiceImage(bundleString, width: width, height: height, tintColor: tintColor, contentMode: contentMode, imageAlignment: imageAlignment), offset: offset)
    }

    /// Initializes a `NiceButtonImage` with a system icon.
    /// - Parameters:
    ///   - systemIcon: The system icon name.
    ///   - width: Width for the icon. Default is 16.
    ///   - height: Height for the icon. Default is 14.
    ///   - tintColor: Optional tint color for the icon.
    ///   - contentMode: How the UI fits the icon within its bounds. Defaults to `.fill`.
    ///   - imageAlignment: The alignment of the icon within its frame. Defaults to `.center`.
    ///   - offset: The horizontal offset for the icon. Defaults to 8.
    public init(
        systemIcon: String,
        width: CGFloat = 16,
        height: CGFloat = 14,
        tintColor: Color? = nil,
        contentMode: SwiftUI.ContentMode = .fill,
        imageAlignment: Alignment = .center,
        offset: CGFloat = 8
    ) {
        self.init(NiceImage(systemIcon: systemIcon, width: width, height: height, tintColor: tintColor, contentMode: contentMode, imageAlignment: imageAlignment), offset: offset)
    }

    /// Initializes a `NiceButtonImage` with an image from an URL.
    /// - Parameters:
    ///   - url: The URL of the image. Optional.
    ///   - width: Width for the icon. Default is 16.
    ///   - height: Height for the icon. Default is 14.
    ///   - tintColor: Optional tint color for the image.
    ///   - fallbackImage: A fallback image string identifier to use if the URL image cannot be loaded. Optional.
    ///   - contentMode: How the UI fits the image within its bounds. Defaults to `.fill`.
    ///   - loadingStyle: The style for the activity indicator shown while the image is loading. Optional.
    ///   - imageAlignment: The alignment of the image within its frame. Defaults to `.center`.
    ///   - offset: The horizontal offset for the image. Defaults to 8.
    public init(
        _ url: URL?,
        width: CGFloat = 16,
        height: CGFloat = 14,
        tintColor: Color? = nil,
        fallbackImage: String? = nil,
        contentMode: SwiftUI.ContentMode = .fill,
        loadingStyle: UIActivityIndicatorView.Style? = nil,
        imageAlignment: Alignment = .center,
        offset: CGFloat = 8
    ) {
        self.init(NiceImage(url, width: width, height: height, tintColor: tintColor, contentMode: contentMode, imageAlignment: imageAlignment), offset: offset)
    }
}
