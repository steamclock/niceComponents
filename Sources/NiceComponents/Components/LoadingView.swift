//
//  LoadingView.swift
//  
//
//  Created by Brendan on 2021-08-12.
//

import SwiftUI
import UIKit

public struct LoadingView: View {
    let loadingText: String?
    let activityIndicatorStyle: UIActivityIndicatorView.Style
    let typeStyle: TypeStyle?

    public init(_ loadingText: String? = nil,typeStyle: TypeStyle? = nil, indicatorStyle: UIActivityIndicatorView.Style = .large) {
        self.loadingText = loadingText ?? "Loading"
        self.activityIndicatorStyle = indicatorStyle
        self.typeStyle = typeStyle
    }
    

    public var body: some View {
        VStack(alignment: .center) {
            ActivityIndicator(isAnimating: true) { $0.style = activityIndicatorStyle }

            if let text = loadingText {
                BodyText(text, style: typeStyle)
            }
        }
    }
}
