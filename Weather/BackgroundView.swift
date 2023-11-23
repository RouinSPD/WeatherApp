//
//  BackgroundView.swift
//  Weather
//
//  Created by Pedro Daniel Rouin Salazar on 21/11/23.
//

import SwiftUI

struct CloudyBackgroundView: View {
    // Cloud data with different starting offsets and durations
    private let clouds: [Cloud] = [
        Cloud(id: 1, width: 100, height: 60, yOffset: -300, duration: 50, initialOffset: 0),
        Cloud(id: 2, width: 160, height: 120, yOffset: 0, duration: 40, initialOffset: UIScreen.main.bounds.width * 0.5),
        Cloud(id: 3, width: 150, height: 90, yOffset: 200, duration: 60, initialOffset: UIScreen.main.bounds.width)
    ]

    var body: some View {
        ZStack {
            Color.blue.opacity(0.85).edgesIgnoringSafeArea(.all) // Blue background

            ForEach(clouds) { cloud in
                CloudView(cloud: cloud)
            }
        }//.accessibilityElement(children: .ignore)
    }
}

struct Cloud: Identifiable {
    let id: Int
    let width: CGFloat
    let height: CGFloat
    let yOffset: CGFloat
    let duration: Double
    let initialOffset: CGFloat
}

struct CloudView: View {
    let cloud: Cloud
    @State private var movingOffset: CGFloat

    init(cloud: Cloud) {
        self.cloud = cloud
        _movingOffset = State(initialValue: cloud.initialOffset)
    }

    var body: some View {
        Image(systemName: "cloud.fill")
            .resizable()
            .scaledToFit()
            .frame(width: cloud.width, height: cloud.height)
            .foregroundColor(.white.opacity(0.65))
            .offset(x: movingOffset, y: cloud.yOffset)
            .onAppear {
                startMovingCloud()
            }
    }

    private func startMovingCloud() {
        let screenWidth = UIScreen.main.bounds.width
        let totalDistance = screenWidth + cloud.width * 2 // Ensuring it goes completely off-screen

        withAnimation(Animation.linear(duration: cloud.duration).repeatForever(autoreverses: false)) {
            movingOffset = -totalDistance
        }
    }
}

struct BackgroundView: View {
    var body: some View {
        CloudyBackgroundView()
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
