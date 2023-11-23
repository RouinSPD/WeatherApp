//
//  HourlyForecastView.swift
//  Weather
//
//  Created by Pedro Daniel Rouin Salazar on 13/11/23.
//

import SwiftUI

struct HourlyWeather: Identifiable {
    var id = UUID()
    var hour: String
    var icon: String
    var temperature: String
    var precipitationProbability: Int?
    var accesibilityText : String
}

struct HourlyWeatherView : View{
    var hour : HourlyWeather
    
    var body: some View{
        VStack{
            Text(hour.hour)
                .foregroundColor(.white)
                .font(.headline)
            
            //.padding(0)
            Image(systemName: hour.icon)
                .symbolRenderingMode(.multicolor).resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            //.renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                
                .foregroundColor(.white)
                //.padding()
                .font(.headline)
            Text("\(hour.temperature)")
                .foregroundColor(.white)
                .font(.headline)
            
        }
        .accessibilityElement(children: .combine)
        .padding(.horizontal, 7)
    }
    
}

struct HourlyForecastView: View {
    let hourlyForecast : [HourlyWeather] = [
        HourlyWeather(hour: "Now", icon: "cloud.fill", temperature: "17°", accesibilityText: "Now, mostly clouded, 17 degrees"),
        HourlyWeather(hour: "16", icon: "cloud.fill", temperature: "17°" , accesibilityText: "16, mostly clouded, 17 degrees"),
        HourlyWeather(hour: "16:40", icon: "sunset.fill", temperature: "Sunset", accesibilityText: "16:40, sunset "),
        HourlyWeather(hour: "17", icon: "cloud.fill", temperature: "16°" , accesibilityText: "17, mostly clouded, 16 degrees"),
        HourlyWeather(hour: "18", icon: "cloud.fill", temperature: "15°", accesibilityText: "18, mostly clouded, 15 degrees"),
        HourlyWeather(hour: "19", icon: "cloud.fill", temperature: "14°", accesibilityText: "19, mostly clouded, 14 degrees "),
        HourlyWeather(hour: "20", icon: "cloud.fill", temperature: "14°", accesibilityText: "20, mostly clouded, 14 degrees"),
        HourlyWeather(hour: "21", icon: "cloud.moon.fill", temperature: "14°", accesibilityText: "21, partly clouded, 14 degrees"),
        HourlyWeather(hour: "22", icon: "cloud.moon.fill", temperature: "14°", accesibilityText: "22, partly clouded, 14 degrees"),
        HourlyWeather(hour: "23", icon: "cloud.fill", temperature: "15°", accesibilityText: "23, mostly clouded, 15 degrees"),
        HourlyWeather(hour: "00", icon: "cloud.fill", temperature: "15°", accesibilityText: "00, mostly clouded, 15 degrees"),
        HourlyWeather(hour: "01", icon: "cloud.fill", temperature: "15°", accesibilityText: "01, mostly clouded, 15 degrees"),
        HourlyWeather(hour: "02", icon: "cloud.fill", temperature: "16°", accesibilityText: "02, mostly clouded, 16 degrees"),
        HourlyWeather(hour: "03", icon: "cloud.fill", temperature: "16°", accesibilityText: "03, mostly clouded, 16 degrees"),
        HourlyWeather(hour: "04", icon: "cloud.fill", temperature: "15°", accesibilityText: "04, mostly clouded, 15 degrees"),
        HourlyWeather(hour: "05", icon: "cloud.fill", temperature: "15°", accesibilityText: "05, mostly clouded, 15 degrees "),
        HourlyWeather(hour: "06", icon: "wind", temperature: "15°", accesibilityText: "06, windy, 15 degrees"),
        HourlyWeather(hour: "06:58", icon: "sunrise.fill", temperature: "Sunrise", accesibilityText: "06:58, sunrise"),
        HourlyWeather(hour: "07", icon: "wind", temperature: "15°", accesibilityText: "07, windy, 15 degrees"),
        HourlyWeather(hour: "08", icon: "wind", temperature: "15°", accesibilityText: "08, windy, 15 degrees"),
        HourlyWeather(hour: "09", icon: "wind", temperature: "16°", accesibilityText: "09, windy, 16 degrees"),
        HourlyWeather(hour: "10", icon: "wind", temperature: "16°", accesibilityText: "10, windy, 16 degrees"),
        HourlyWeather(hour: "11", icon: "wind", temperature: "17°",  accesibilityText: "11, windy, 17 degrees"),
        HourlyWeather(hour: "12", icon: "sun.max.fill", temperature: "17°",  accesibilityText: "12, clear, 17 degrees"),
        HourlyWeather(hour: "13", icon: "sun.max.fill", temperature: "18°",  accesibilityText: "13, clear, 18 degrees"),
        HourlyWeather(hour: "14", icon: "sun.max.fill", temperature: "18°",  accesibilityText: "14, clear, 18 degrees "),
        HourlyWeather(hour: "15", icon: "sun.max.fill", temperature: "18°", accesibilityText: "15, clear, 18 degrees"),
    ]
    var body: some View {
        ZStack {
            //Color(.blue)
            //Image("pinkSky")
            VStack{
                Text("Cloudy conditions expected around 23:00.")
                    .foregroundColor(.white)
                    .font(.callout)
                
                Divider()
                ScrollView(.horizontal) {
                HStack {
                    ForEach(hourlyForecast) { hour in
                        HourlyWeatherView(hour: hour)
                            .accessibilityLabel(Text(hour.accesibilityText))
                            //.padding([.top])
                        
                        
                        /*if hour.id != hourlyForecast.last?.id {
                            Divider()
                                .background(Color.white)
                        }*/
                        
                    }
                            }
                    
                        }
            }.font(.system(size: 12))
                .padding(10)
            .background(
            RoundedRectangle(cornerRadius: 15)
            .fill(Color.gray.opacity(0.4))
                        )
            .padding([.trailing, .leading], 20)
        }
    }
}

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView()
    }
}
