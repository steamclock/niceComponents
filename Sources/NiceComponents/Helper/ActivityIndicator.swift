//
//  File.swift
//  
//
//  Created by Brendan on 2021-08-23.
//

import SwiftUI
import UIKit

public struct ActivityIndicator: UIViewRepresentable {
    public typealias UIView = UIActivityIndicatorView

    var isAnimating: Bool
    var configuration = { (indicator: UIView) in }

    public func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView { UIView() }
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}
