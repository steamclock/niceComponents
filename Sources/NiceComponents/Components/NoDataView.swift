//
//  NoDataView.swift
//  
//
//  Created by Brendan on 2022-07-15.
//

import SwiftUI

public struct NoDataView: View {
    private let message: String

    public init(message: String? = nil) {
        let defaultMessage = "No data."
        self.message = message ?? defaultMessage
    }

    public var body: some View {
        VStack(alignment: .center) {
            BodyText(message)
        }
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView()
    }
}
