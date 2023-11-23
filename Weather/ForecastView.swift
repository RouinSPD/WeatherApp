//
//  ForecastView.swift
//  Weather
//
//  Created by Pedro Daniel Rouin Salazar on 15/11/23.
//

import SwiftUI

struct ForecastView: View {
    var days = ["Today", "Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"]
    var images = [
        "cloud.sun.fill",
        "cloud.sun.rain.fill",
        "cloud.bolt.fill",
        "cloud.fill",
        "sun.max.fill",
        "moon.stars.fill",
        "cloud.moon.fill",
        "cloud.moon.rain.fill",
        "cloud.bolt.rain.fill",
        "sunrise.fill"
    ]

    var body: some View {
        VStack(spacing: 0) { // Elimina el espaciado entre elementos del VStack
            ForEach(days.indices, id: \.self) { index in
                HStack {
                    Text(days[index])
                        .foregroundColor(.white)
                        .padding(.leading, 5) // Ajusta el espacio entre la imagen y el texto
                        .frame(maxWidth: .infinity, alignment: .leading) // Alinear el texto a la izquierda
                    
                    Image(systemName: images[index % images.count]) // Seleccionar la imagen del arreglo
                        .foregroundColor(.white)
                }
                .padding()
                //.foregroundColor(.blue)
                //.background(Color.gray.opacity(0.1)) // Color de fondo para toda la fila
                .cornerRadius(10)
                
                Divider().background(Color.gray) // Añade un Divider con fondo gris
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 20) // Añade bordes curvos alrededor del VStack
                //.stroke(Color.black, lineWidth: 2) // Grosor y color del borde
               // .background(Color.blue) // Color de fondo del RoundedRectangle
                //.padding() // Añade espacio entre el RoundedRectangle y el contenido
        )
        .padding() // Añade espaciado alrededor del VStack
        .navigationTitle("Lista de Elementos")
    }
}


#Preview {
    ForecastView()
}
