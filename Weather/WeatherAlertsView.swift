//
//  WeatherAlertsView.swift
//  Weather
//
//  Created by Pedro Daniel Rouin Salazar on 20/11/23.
//

import SwiftUI

struct WeatherAlertsView: View {
    var body: some View {
        ZStack {
            //Color(.blue)
            //Image("pinkSky")
            VStack(alignment: .leading){
                HStack {
                               Label {
                                   Text("WEATHER ALERTS")
                                       .font(.subheadline)
                               } icon: {
                                   Image(systemName: "exclamationmark.triangle.fill")
                               }
                               .foregroundColor(.white.opacity(0.7))

                               Spacer() // Pushes the label to the left
                           }
                .padding(.vertical,3)
                Text("Severe Weather")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                    .padding(.vertical,1)
                Text("Moderate Thunderstorm Warning. These conditions are expected by 13:00 on Tuesday 21 November. Additinal alert: Moderate Rain Warning.")
                    .foregroundStyle(.white)
                Text("Italian Air Force National Meteorological Service")
                    .foregroundStyle(.white.opacity(0.7))
                    .font(.footnote)
                
                
                
              
            }//.font(.system(size: 12))
            .padding()
            .background(
            RoundedRectangle(cornerRadius: 15)
            .fill(Color.gray.opacity(0.4))
                        )
            .padding([.top, .leading], 20) // Ajusta los valores según tus necesidades
        .padding(.trailing, 20)
        }
    }
}

#Preview {
    WeatherAlertsView()
}
