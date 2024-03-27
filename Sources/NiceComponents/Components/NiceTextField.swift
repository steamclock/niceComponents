//
//  NiceTextField.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import SwiftUI

/// Create a nice looking text entry field.
public struct NiceTextField: View {
    /// The text entered by the user, bound to a variable.
    @Binding public var text: String

    /// Identifies the semantic meaning of the text content, aiding in content-specific keyboard layout. Defaults to `nil`.
    public let contentType: UITextContentType?

    /// Specifies the keyboard type that appears when the text field is in focus. Defaults to `.default`.
    public let keyboardType: UIKeyboardType

    /// Determines whether the text field is for secure text entry. Defaults to `false`.
    public let isSecure: Bool

    /// Placeholder text displayed when there is no other text in the text field.
    public let placeholder: String

    /// The style applied to the placeholder text.
    public let placeholderStyle: NiceTextStyle

    /// The overall style applied to the text field, affecting its visual appearance.
    public let style: NiceButtonStyle

    /// An optional image displayed to the left of the text field. Defaults to `nil`.
    var leftImage: NiceButtonImage?

    /// Initializes a `NiceTextField` with customizable properties.
    /// - Parameters:
    ///   - text: A binding to the text entered by the user.
    ///   - style: The overall style of the text field.
    ///   - contentType: The content type for the text field, affecting keyboard type.
    ///   - keyboardType: The keyboard type for the text field.
    ///   - isSecure: Indicates whether the text field is for secure text entry.
    ///   - placeholder: The placeholder text for the text field.
    ///   - placeholderStyle: The style for the placeholder text.
    ///   - leftImage: An optional image to display on the left side of the text field.
    public init(
        _ text: Binding<String>,
        style: NiceButtonStyle? = nil,
        contentType: UITextContentType? = nil,
        isSecure: Bool = false,
        keyboardType: UIKeyboardType = .default,
        placeholder: String = "",
        placeholderStyle: NiceTextStyle? = nil,
        leftImage: NiceButtonImage? = nil
    ) {
        self._text = text
        self.style = style ?? Config.current.textFieldStyle
        self.contentType = contentType
        self.isSecure = isSecure
        self.keyboardType = keyboardType
        self.placeholder = placeholder
        self.placeholderStyle = placeholderStyle ?? Config.current.textFieldPlaceholderStyle
        self.leftImage = leftImage
    }

    public var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                if !text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(placeholderStyle.color)
                        .scaledFont(
                            name: placeholderStyle.font,
                            size: placeholderStyle.size,
                            weight: placeholderStyle.weight,
                            maxSize: placeholderStyle.dynamicTypeMaxSize
                        )
                }

                HStack(spacing: 0) {
                    if let leftImage = leftImage {
                        leftImage.image
                            .padding(.trailing, leftImage.offset)
                    }

                    if isSecure {
                        SecureField(placeholder, text: $text)
                            .foregroundColor(text.isEmpty ? style.colorStyle.inactiveOnSurface : style.colorStyle.onSurface)
                            .keyboardType(keyboardType)
                            .textContentType(contentType)
                    } else {
                        TextField(placeholder, text: $text)
                            .foregroundColor(text.isEmpty ? style.colorStyle.inactiveOnSurface : style.colorStyle.onSurface)
                            .keyboardType(keyboardType)
                            .textContentType(contentType)
                    }
                }
            }.padding(.horizontal, 16)
            .padding(.vertical, text.isEmpty ? 16 : 8)
        }.frame(maxWidth: .infinity)
        .frame(height: style.height)
        .fixedSize(horizontal: false, vertical: true)
        .background(style.colorStyle.surface)
        .cornerRadius(style.border.cornerRadius)
        .overlay(
            style.borderOverlay
        )
        .padding(style.paddingToAdd)
    }
}

struct NiceTextField_Previews: PreviewProvider {
    static var previews: some View {
        NiceTextField(.constant("Nice!"))
    }
}
