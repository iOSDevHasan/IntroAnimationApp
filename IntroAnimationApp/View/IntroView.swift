//
//  IntroView.swift
//  IntroAnimationApp
//
//  Created by HASAN BERAT GURBUZ on 3.11.2024.
//

import SwiftUI

struct IntroView: View {

    // MARK: - PROPERTIES

    private let customColor = Color(red: 0/255, green: 11/255, blue: 88/255)
    @State var showOtherScreens: Bool = false

    // MARK: - BODY

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            IntroView()
                .animation(
                    .interactiveSpring(
                        response: 1.1,
                        dampingFraction: 0.85,
                        blendDuration: 0.85
                    ),
                    value: showOtherScreens
                )
                .fullScreenCover(isPresented: $showOtherScreens) {
                    OnboardingView()
                }
        }
    }

    // MARK: - INTROVIEW

    @ViewBuilder
    private func IntroView() -> some View {
        GeometryReader {
            let size = $0.size
            VStack(spacing: 10) {
                Image("intro")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height / 2)
                Text("Welcome Sir")
                    .font(.title.bold())
                    .padding(.top, 50)
                Button("Lets Begin") {
                    showOtherScreens.toggle()
                }
                .padding(.horizontal, 40)
                .padding(.vertical, 15)
                .foregroundColor(.white).bold()
                .background {
                    Capsule()
                        .fill(customColor)
                }
                .padding(.top, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .offset(y: showOtherScreens ? -size.height : 0)
        }
        .ignoresSafeArea()
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}
