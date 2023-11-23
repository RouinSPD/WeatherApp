//
//  ContentView.swift
//  Weather
//
//  Created by Pedro Daniel Rouin Salazar on 13/11/23.
//

import SwiftUI

// Define your DailyWeather and TenDayForecastView as before

struct ContentView: View {
  
    var hourly = HourlyForecastView()
    var airQuality = AirQualityView()
    var weatherAlert = WeatherAlertsView()
    let background = CloudyBackgroundView()
    var dailyView = DailyView()
    var body: some View {
        ZStack{
            background
            VStack{
                Text("My Location")
                    .font(.title)
                    .foregroundStyle(.white)
                    //.fontWeight(.semibold)
                    //.font(.system(size: 60))
                Text("NAPLES")
                    .font(.caption)
                    .foregroundStyle(.white)
                    .bold()
                ScrollView {
                    Text("20°")
                    .foregroundStyle(.white)
                    .font(.title)
                    //.font(.system(size: ))
                    
                    hourly
                    dailyView
                        .padding(.bottom)
                    airQuality
                    weatherAlert
                }
                // Apply any necessary modifiers to the ScrollView if needed
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



#Preview {
    ContentView()
}
