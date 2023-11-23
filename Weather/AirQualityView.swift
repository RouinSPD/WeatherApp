//
//  AirQualityView.swift
//  Weather
//
//  Created by Pedro Daniel Rouin Salazar on 17/11/23.
//

import SwiftUI

struct AirQualityView: View {
    
    var body: some View {
        VStack {
            HStack {
                           Label {
                               Text("AIR QUALITY")
                                   .font(.subheadline)
                           } icon: {
                               Image(systemName: "aqi.low")
                           }
                           .foregroundColor(.white)

                           Spacer() // Pushes the label to the left
                       }
                       .padding(.top)
            Text("Fair")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 4)
            
            Capsule()
                .fill(LinearGradient(gradient: Gradient(colors: [.green, .yellow, .orange, .red, .purple]), startPoint: .leading, endPoint: .trailing))
                .frame(height: 4)
                .overlay(
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 2, height: 10)
                        .offset(x: 10) // Adjust this value based on current air quality
                )
            
            Text("Air quality is similar to yesterday at about this time.")
                .font(.footnote)
                .foregroundColor(.white)
                .padding(.bottom)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal)
        .background(RoundedRectangle(cornerRadius: 20) .fill(Color.gray.opacity(0.4)))
        .frame(width: 350, height: 120)
    }
}

struct AirQualityView_Previews: PreviewProvider {
    static var previews: some View {
        AirQualityView()
            .previewLayout(.sizeThatFits)
           // .background(Color(.systemTeal))
    }
}
