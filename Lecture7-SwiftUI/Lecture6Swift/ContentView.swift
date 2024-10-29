//
//  ContentView.swift
//  Lecture6Swift
//
//  Created by Vittoria Frau on 25/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State var isNightMode: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(backgroundColor: isNightMode ? .black : .blue)
            
            VStack{
                Text("Aarhus, DK")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                
                Image(systemName: "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
                Text("10°C")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                
                Spacer()
                
                HStack (spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", icon: "cloud.sun.fill", temperature: "10°C")
                    WeatherDayView(dayOfWeek: "WED", icon: "cloud.heavyrain.fill", temperature: "8°C")
                    WeatherDayView(dayOfWeek: "THU", icon: "cloud.bolt.fill", temperature: "5°C")
                    WeatherDayView(dayOfWeek: "FRI", icon: "sun.max.fill", temperature: "12°C")
                    WeatherDayView(dayOfWeek: "SAT", icon: "tornado", temperature: "10°C")
                    WeatherDayView(dayOfWeek: "SUN", icon: "snow", temperature: "8°C")
                    
                }
                Spacer()
                
                Button("Nightmode",
                       action: {
                    isNightMode = true
                }
                )
                .frame(width: 180, height: 50)
                .font(.system(size: 20, weight: .medium))
                .background(Color.white)
                .cornerRadius(20)
                Spacer()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek : String
    var icon : String
    var temperature : String
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .foregroundColor(.white)
                .fontWeight(.medium)
                .font(.title3)
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text(temperature)
                .foregroundColor(.white)
                .fontWeight(.medium)
                .font(.title3)
        }
    }
}


struct BackgroundView: View {
    var backgroundColor : Color
    var body: some View {
        Color(backgroundColor)
            .edgesIgnoringSafeArea(.all)
    }
}
