//
//  OnboardingView.swift
//  IntroAnimationApp
//
//  Created by HASAN BERAT GURBUZ on 2.11.2024.
//

import SwiftUI
import Lottie

struct OnboardingView: View {
    
    // MARK: - PROPERTIES

    private let customColor = Color(red: 0/255, green: 11/255, blue: 88/255)
    @State private var currentIndex: Int = 0
    @State private var onboardingItems: [OnboardItemModel] = [
        OnboardItemModel(
            title: "Request Pickup",
            subTitle: "Tell us who you are sending it to. What you are sending...",
            lottieView: .init(
                name: "animationtruck",
                bundle: .main
            )
        ),
        OnboardItemModel(
            title: "Track Delivery",
            subTitle: "Your package is on way. If you want to cancel delivery this is the last time :)...",
            lottieView: .init(
                name: "deliveringTruckMoves",
                bundle: .main
            )
        ),
        OnboardItemModel(
            title: "Recieve Package",
            subTitle: "The journey ends when your package get to its location. You got notif about code which you have to tell when recieving package",
            lottieView: .init(
                name: "deliveringPackage",
                bundle: .main
            )
        )
    ]

    // MARK: - BODY

    var body: some View {
        GeometryReader {
            let size = $0.size
            let offset = -CGFloat(currentIndex) * size.width

            HStack(spacing: 0) {
                ForEach($onboardingItems) { $item in
                    VStack {
                        TopNavigationBarView()
                        ResizeableLotieView(onboardingItem: $item)
                            .frame(height: size.width)
                            .onAppear {
                                if currentIndex == indexOf(item) {
                                    item.lottieView.play(toProgress: 0.7)
                                }
                            }
                            .offset(x: offset)
                            .animation(.easeInOut(duration: 0.5), value: currentIndex)
                        
                        DesprictionAreaView(item: item)
                            .offset(x: offset)
                            .animation(.easeInOut(duration: 0.5).delay(0.1), value: currentIndex)
                        BottomView()
                    }
                    .padding(15)
                    .frame(width: size.width, height: size.height)
                }
            }
            .frame(width: size.width * CGFloat(onboardingItems.count), alignment: .leading)
        }
    }

    // MARK: - PRIVATE METHODS

    private func indexOf(_ item: OnboardItemModel) -> Int {
        if let index = onboardingItems.firstIndex(of: item) {
            return index
        }
        return 0
    }

    private func playAnimation() {
        onboardingItems[currentIndex].lottieView.currentProgress = 0
        onboardingItems[currentIndex].lottieView.play(toProgress: 0.7)
    }

    // MARK: - PRIVATE VIEW FUNCTIONS

    @ViewBuilder
    private func TopNavigationBarView() -> some View {
        HStack {
            if currentIndex > 0 {
                Button("Back") {
                    if currentIndex > 0 {
                        currentIndex -= 1
                        playAnimation()
                    }
                }
            }
            Spacer()
            if currentIndex < onboardingItems.count - 1 {
                Button("Skip") {
                    currentIndex = onboardingItems.count - 1
                    playAnimation()
                }
            }
        }
        .tint(customColor)
        .fontWeight(.bold)
    }

    @ViewBuilder
    private func DesprictionAreaView(item: OnboardItemModel) -> some View {
        VStack(spacing: 15) {
            Text(item.title)
                .font(.title.bold())
            Text(item.subTitle)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 15)
                .foregroundColor(.gray)
        }
    }

    @ViewBuilder
    private func BottomView() -> some View {
        let islastSlide = currentIndex == onboardingItems.count - 1
        Spacer()
        VStack(spacing: 15) {
            Button(islastSlide ? "Login" : "Next") {
                if currentIndex < onboardingItems.count - 1 {
                    currentIndex += 1
                    playAnimation()
                }
            }
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.vertical, islastSlide ? 13 : 12)
            .frame(maxWidth: .infinity)
            .background {
                Capsule()
                    .fill(customColor)
            }
            .padding(.horizontal, islastSlide ? 30 : 100)

            HStack {
                Text("Terms of Service")
                Text("Privacy Policy")
            }
            .font(.caption2)
            .underline(true, color: .primary)
            .offset(y: 5)
        }
        .animation(.easeInOut, value: islastSlide)
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}
