//
//  ErrorView.swift
//  NiceComponents
//
//  Created by Brendan on 2022-07-15.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

public struct ErrorView: View {
    private let error: Error

    public init(error: Error) {
        self.error = error
    }

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
