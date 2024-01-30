//
//  NiceTextField.swift
//  
//
//  Created by Brendan on 2023-01-04.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// Create a nice looking text entry field.
public struct NiceTextField: View {
    /// The published text entered in the TextField.
    @Binding public var text: String

    /// The `UITextContentType` of the entered text, identifying the semantic meaning. Default is `nil`.
    public let contentType: UITextContentType?

    /// The keyboard type to display when entering text. Default is `.default`.
    public let keyboardType: UIKeyboardType

    /// Toggles if the entered text should be shown in plain text or not. Default is `false`.
    public let isSecure: Bool

    /// The placeholder text to be shown full size if no other text has been entered, or above the entered text if present.
    public let placeholder: String

    /// The `NiceTextStyle` to apply to the placeholder text when it is shown.
    /// Note that if no text has been entered the placeholder will be shown using the main text's size and font, but its own coloring
    public let placeholderStyle: NiceTextStyle

    /// The styling to apply to the text field, including the user-entered text.
    public let style: NiceButtonStyle

    /// An optional image, shown to the left of the entry field.
    public var leftImage: NiceImage?

    /// How far to offset the image from the entry field.
    public var leftImageOffset: CGFloat?

    public static var defaultStyle: NiceButtonStyle {
        Config.current.textFieldStyle
    }

    /**
     * Create a new NiceTextField.
     *
     * - Parameters:
     *  - contentType: The `UITextContentType` of the entered text, identifying the semantic meaning. Default is `nil`.
     *  - isSecure: Toggles if the entered text should be shown in plain text or not. Default is `false`.
     *  - keyboardType: The keyboard type to display when entering text. Default is `.default`.
     *  - placeholder: The placeholder text to be shown full size if no other text has been entered, or above the entered text if present.
     *  - placeholderStyle: The `NiceTextStyle` to apply to the placeholder text when it is shown.
     *  - style: The styling to apply to the text field, including the user-entered text.
     *  - text:
     */
    public init(
        contentType: UITextContentType? = nil,
        isSecure: Bool = false,
        keyboardType: UIKeyboardType = .default,
        placeholder: String = "",
        placeholderStyle: NiceTextStyle? = nil,
        style: NiceButtonStyle? = nil,
        text: Binding<String>
    ) {
        self.contentType = contentType
        self.isSecure = isSecure
        self.keyboardType = keyboardType
        self.placeholder = placeholder
        self.placeholderStyle = placeholderStyle ?? Config.current.textFieldPlaceholderStyle
        self.style = style ?? Config.current.textFieldStyle
        self._text = text
    }

    public var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                if !text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(placeholderStyle.textTheme.color)
                        .scaledFont(
                            name: placeholderStyle.fontTheme.name,
                            size: placeholderStyle.fontTheme.size,
                            weight: placeholderStyle.fontTheme.weight,
                            maxSize: placeholderStyle.fontTheme.dynamicTypeMaxSize
                        )
                }

                HStack(spacing: 0) {
                    if let leftImage = leftImage {
                        leftImage
                            .padding(.trailing, leftImageOffset)
                    }

                    if isSecure {
                        SecureField(placeholder, text: $text)
                            .foregroundColor(text.isEmpty ? style.inactiveOnSurfaceColor : style.onSurfaceColor)
                            .keyboardType(keyboardType)
                            .textContentType(contentType)
                    } else {
                        TextField(placeholder, text: $text)
                            .foregroundColor(text.isEmpty ? style.inactiveOnSurfaceColor : style.onSurfaceColor)
                            .keyboardType(keyboardType)
                            .textContentType(contentType)
                    }
                }
            }.padding(.horizontal, 16)
            .padding(.vertical, text.isEmpty ? 16 : 8)
        }.frame(maxWidth: .infinity)
        .frame(height: style.height)
        .fixedSize(horizontal: false, vertical: true)
        .background(style.surfaceColor)
        .cornerRadius(style.border.cornerRadius)
        .overlay(
            style.borderOverlay
        )
        .padding(style.paddingToAdd)
    }
}
