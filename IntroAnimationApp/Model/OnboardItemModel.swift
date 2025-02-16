//
//  OnboardItemModel.swift
//  IntroAnimationApp
//
//  Created by HASAN BERAT GURBUZ on 2.11.2024.
//

import SwiftUI
import Lottie

struct OnboardItemModel: Identifiable, Equatable {
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var lottieView: LottieAnimationView = .init()
}
