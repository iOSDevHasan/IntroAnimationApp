//
//  ResizeableLotieView.swift
//  IntroAnimationApp
//
//  Created by HASAN BERAT GURBUZ on 3.11.2024.
//

import SwiftUI

struct ResizeableLotieView: UIViewRepresentable {

    // MARK: - PROPERTIES

    @Binding var onboardingItem: OnboardItemModel

    // MARK: - METHODS

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        setupLottieView(view)
        return view
    }

    func setupLottieView(_ to: UIView) {
        let lottieView = onboardingItem.lottieView
        lottieView.backgroundColor = .clear
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor),
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor)
        ]
        to.addSubview(lottieView)
        to.addConstraints(constraints)
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
