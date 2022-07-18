//
//  LoadingView.swift
//  
//
//  Created by Brendan on 2021-08-12.
//

import SwiftUI
import UIKit

public struct LoadingView: View {
    var loadingText: String? = "Loading"
    @State var playAnimation = true

    public init(_ loadingText: String? = nil) {
        if let text = loadingText {
            self.loadingText = text
        }
    }

    public var body: some View {
        VStack(alignment: .center) {
            ActivityIndicator(isAnimating: true) { $0.style = .large }

            if let text = loadingText {
                BodyText(text)
            }
        }
    }
}
