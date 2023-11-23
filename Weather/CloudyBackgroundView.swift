//
//  CloudyBackgroundView.swift
//  Weather
//
//  Created by Pedro Daniel Rouin Salazar on 21/11/23.
//

import SwiftUI

struct CloudyBackgroundView: View {
    @State private var cloudOffset = CGFloat.zero

    let cloudAnimationDuration: Double = 20

    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all) // Blue background

            // Add as many clouds as you like
            Image("cloud") // Replace with your cloud image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 100)
                .offset(x: cloudOffset, y: 50)
                .animation(Animation.linear(duration: cloudAnimationDuration)
                            .repeatForever(autoreverses: false), value: cloudOffset)

            Image("cloud") // Second cloud
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 120)
                .offset(x: -cloudOffset, y: -50)
                .animation(Animation.linear(duration: cloudAnimationDuration)
                            .repeatForever(autoreverses: false), value: cloudOffset)

            // Add your content here
            // ...
        }
        .onAppear {
            cloudOffset = UIScreen.main.bounds.width
        }
    }
}

struct ContentView: View {
    var body: some View {
        CloudyBackgroundView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
