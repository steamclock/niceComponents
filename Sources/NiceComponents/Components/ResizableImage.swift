//
//  ResizableImage.swift
//  
//
//  Created by Brendan on 2021-03-12.
//

import SwiftUI
import UIKit

public struct ResizableImage<Placeholder: View>: View {
    public let bundleString: String?
    public let systemIcon: String?
    public let url: URL?
    public let width: CGFloat
    public let height: CGFloat
    public let tintColor: Color?
    public let contentMode: ContentMode
    let placeholderView: () -> Placeholder

    public init(
        _ url: URL?,
        maxWidth: CGFloat,
        maxHeight: CGFloat,
        tintColor: Color? = nil,
        contentMode: ContentMode = .fit,
        placeholderView: @escaping () -> Placeholder
    ) {
        self.url = url
        self.bundleString = nil
        self.systemIcon = nil
        self.height = maxHeight
        self.width = maxWidth
        self.tintColor = tintColor
        self.contentMode = contentMode
        self.placeholderView = placeholderView
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
            AsyncImage(url: url) { image in
                image.resizable()
                    .renderingMode(tintColor == nil ? .original : .template)
                    .aspectRatio(contentMode: contentMode)
                    .frame(maxWidth: width, maxHeight: height)
                    .foregroundColor(tintColor)
            } placeholder: {
                placeholderView()
                    .frame(width: width, height: height)
            }
        } else if let image = image {
            image
                .renderingMode(tintColor == nil ? .original : .template)
                .resizable()
                .frame(width: width, height: height)
                .foregroundColor(tintColor)
                .aspectRatio(contentMode: contentMode)
                .clipped()
        } else {
            EmptyView()
        }
    }
}

public extension ResizableImage where Placeholder == LoadingView<EmptyView>  {
    init(
        _ url: URL?,
        maxWidth: CGFloat,
        maxHeight: CGFloat,
        tintColor: Color? = nil,
        loadingStyle: UIActivityIndicatorView.Style = .large,
        contentMode: ContentMode = .fit
    ) {
        self.bundleString = nil
        self.systemIcon = nil
        self.url = url
        self.width = maxWidth
        self.height = maxHeight
        self.tintColor = tintColor
        self.contentMode = contentMode
        self.placeholderView = { LoadingView(loadingStyle) }
    }
}

public extension ResizableImage where Placeholder == EmptyView {
    init(
        systemIcon: String,
        width: CGFloat,
        height: CGFloat,
        tintColor: Color? = nil,
        contentMode: ContentMode = .fit
    ) {
        self.bundleString = nil
        self.url = nil
        self.systemIcon = systemIcon
        self.height = height
        self.width = width
        self.tintColor = tintColor
        self.contentMode = contentMode
        self.placeholderView = { EmptyView() }
    }

    init(
        _ bundleString: String,
        width: CGFloat,
        height: CGFloat,
        tintColor: Color? = nil,
        contentMode: ContentMode = .fit
    ) {
        self.bundleString = bundleString
        self.url = nil
        self.systemIcon = nil
        self.width = width
        self.height = height
        self.tintColor = tintColor
        self.contentMode = contentMode
        self.placeholderView = { EmptyView() }
    }
}
