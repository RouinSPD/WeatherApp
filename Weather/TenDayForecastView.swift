//
//  TenDayForecastView.swift
//  Weather
//
//  Created by Pedro Daniel Rouin Salazar on 15/11/23.
//

import SwiftUI

struct DailyWeather: Identifiable {
    var id = UUID()
    var day: String
    var icon: String
    var temperatureLow: Int
    var temperatureHigh: Int
    var precipitationProbability: Int?
    var accesibilityText : String
}

struct TenDayForecastView: View {
    
    var weather: DailyWeather
    let minScaleTemp = 8// Minimum temperature for the scale
    let maxScaleTemp = 20  // Maximum temperature for the scale
    
    var body: some View {
        
            HStack {
                Text(weather.day)
                    .font(.title2)
                    .bold()
                    .frame(width: 70)//sets the frame for the text
                    .frame(alignment: .leading)
                    
                
                Spacer()
                
                VStack(spacing: 0) {  // VStack for icon and precipitation probability
                    Image(systemName: weather.icon)
                        .symbolRenderingMode(.multicolor)
                        .accessibilityLabel(weather.accesibilityText)
                    // Only show precipitation if it exists
                    if let precipitation = weather.precipitationProbability {
                        Text("\(precipitation)%")
                            .font(.caption)
                            .foregroundStyle(.cyan)
                            .bold()
                    }
                }
                .frame(width: 60, height: 20)
                Spacer()
                
                // Temperature values
                Text("\(weather.temperatureLow)°")
                    .font(.title2)
                    .opacity(0.5)
                    .frame(width: 40)
                    .accessibilityLabel(Text("\(weather.temperatureLow)° low"))
                Spacer()
                
                // Temperature bar
                       GeometryReader { geometry in
                           let totalScale = maxScaleTemp - minScaleTemp
                           let scaleRange = CGFloat(totalScale)
                           let lowerBoundOffset = CGFloat(weather.temperatureLow - minScaleTemp) / scaleRange * geometry.size.width
                           let upperBoundOffset = CGFloat(weather.temperatureHigh - minScaleTemp) / scaleRange * geometry.size.width

                           ZStack(alignment: .leading) {
                               // Bottom rectangle (background)
                               Rectangle()
                                   .frame(width: geometry.size.width, height: 8)
                                   .opacity(0.3)
                                   .foregroundColor(Color(UIColor.systemTeal))
                                   .cornerRadius(20)
                               
                               // Gradient for the temperature range
                               LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green, Color.yellow]), startPoint: .leading, endPoint: .trailing)
                                   .frame(width: upperBoundOffset - lowerBoundOffset, height: 8)
                                   .offset(x: lowerBoundOffset, y: 0)
                                   .cornerRadius(20)
                           }
                       }
                       .frame(height: 8)
                       .fixedSize(horizontal: false, vertical: true)
                Spacer()
                
                
                
                
                Text("\(weather.temperatureHigh)°")
                    .font(.title2)
                    .bold()
                    .frame(width: 50)
                    .accessibilityLabel(Text("\(weather.temperatureHigh)° high"))
            }
            //.accessibilityLabel(Text(weather.accesibilityText))
            .accessibilityElement(children: .combine)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
}

struct DailyView: View {
    let weeklyWeather = [
        DailyWeather(day: "Today", icon: "cloud.fill", temperatureLow: 13, temperatureHigh: 18, accesibilityText: "mostly clouded"),
        DailyWeather(day: "Thu", icon: "sun.max.fill", temperatureLow: 14, temperatureHigh: 18, accesibilityText: "clear"),
        DailyWeather(day: "Fri", icon: "cloud.fill", temperatureLow: 11, temperatureHigh: 18, accesibilityText: "mostly clouded"),
        DailyWeather(day: "Sat", icon: "cloud.fill",  temperatureLow: 5, temperatureHigh: 14, precipitationProbability: 80, accesibilityText: "80% chance of rain"),
        DailyWeather(day: "Sun", icon: "sun.max.fill", temperatureLow: 4, temperatureHigh: 11, accesibilityText: "clear"),
        DailyWeather(day: "Mon", icon: "cloud.sun.fill", temperatureLow: 4, temperatureHigh: 13, accesibilityText: "partly clouded"),
        DailyWeather(day: "Tue", icon: "cloud.fill", temperatureLow: 8, temperatureHigh: 14, precipitationProbability: 60, accesibilityText: "60% chance of rain"),
        DailyWeather(day: "Wed", icon: "sun.max.fill", temperatureLow: 6, temperatureHigh: 13, accesibilityText: "clear"),
        DailyWeather(day: "Thu", icon: "cloud.fill", temperatureLow: 6, temperatureHigh: 15, precipitationProbability: 40, accesibilityText: "40% chance of rain"),
        DailyWeather(day: "Fri", icon: "cloud.fill", temperatureLow: 10, temperatureHigh: 17, precipitationProbability: 35, accesibilityText: "35% chance of rain")
        
        // Add more data here...
    ]

    var body: some View {
        ZStack{
            //Color(.blue)
            VStack(alignment: .leading) {
                HStack {
                               Label {
                                   Text("10-DAY FORECAST")
                                       .font(.subheadline)
                               } icon: {
                                   Image(systemName: "calendar")
                               }
                               .foregroundColor(.white)

                               Spacer() // Pushes the label to the left
                           }
            
                

                
                           //.padding(.top)
                Divider()
                ForEach(weeklyWeather) { weather in
                    TenDayForecastView(weather: weather)
                        .padding([.top])
                    
                    
                    if weather.id != weeklyWeather.last?.id {
                        Divider()
                            .background(Color.white)
                    }
                    
                        
                }
               
                
                //.padding(.bottom)
            }
            .padding()
            .background(Color.gray.opacity(0.4))
            .cornerRadius(20)
            .padding(.horizontal)
            .foregroundColor(.white)
            
            
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}

//#Preview {
//    TenDayForecastView()
//}
