//
//  LoadingView.swift
//  
//
//  Created by Brendan on 2021-08-12.
//

import SwiftUI
import UIKit

struct LoadingView: View {
    var loadingText = "Loading"
    @State var playAnimation = true

    var body: some View {
        VStack(alignment: .center) {
            ActivityIndicator(isAnimating: true) { $0.style = .large }
            BodyText(loadingText)
        }
    }
}

struct ActivityIndicator: UIViewRepresentable {
    typealias UIView = UIActivityIndicatorView

    var isAnimating: Bool
    var configuration = { (indicator: UIView) in }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView { UIView() }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}
