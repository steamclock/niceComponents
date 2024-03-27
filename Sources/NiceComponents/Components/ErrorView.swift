//
//  ErrorView.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import SwiftUI

/// A view for displaying an error message.
public struct ErrorView: View {
    /// The error to be displayed.
    private let error: Error

    /// Initializes the view with an error.
    /// - Parameter error: The error to display.
    public init(error: Error) {
        self.error = error
    }

    /// The body of the `ErrorView`. Contains the error message.
    public var body: some View {
        VStack(alignment: .center) {
            NiceText("Error:", style: .body)
            NiceText(error.localizedDescription, style: .body)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: CustomError())
    }
}

private struct CustomError: Error {
    var description: String {
        "Something's gone wrong. Try again later."
    }
}
