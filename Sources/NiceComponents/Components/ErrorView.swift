//
//  ErrorView.swift
//  
//
//  Created by Brendan on 2022-07-15.
//

import SwiftUI

public struct ErrorView: View {
    private let error: Error

    public init(error: Error) {
        self.error = error
    }

    public var body: some View {
        VStack(alignment: .center) {
            BodyText("Error:")
            BodyText(error.localizedDescription)
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
