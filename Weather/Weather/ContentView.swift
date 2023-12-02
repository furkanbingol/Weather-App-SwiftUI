//
//  ContentView.swift
//  Weather
//
//  Created by Furkan Bingöl on 26.11.2023.
//

import SwiftUI

#Preview {
    ContentView()
}

struct ContentView: View {
    
    @State private var isNight = false
    
    let daysArray: [WeatherDay] = [WeatherDay(day: "TUE", systemImageName: "cloud.sun.fill", temperature: 34),
                                   WeatherDay(day: "WED", systemImageName: "sun.max.fill", temperature: 32),
                                   WeatherDay(day: "THU", systemImageName: "wind", temperature: 29),
                                   WeatherDay(day: "FRI", systemImageName: "sunset.fill", temperature: 28),
                                   WeatherDay(day: "SAT", systemImageName: "snow", temperature: 10)]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)         // $ -> Bind these properties

            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 35)
                
                HStack(spacing: 20) {
                    ForEach(daysArray, id: \.day) { i in
                        WeatherDayView(dayOfWeek: i.day, systemImageName: i.systemImageName, temperature: i.temperature)
                    }
                }

                Spacer()       // Geri kalan kısmı 'boşluk = Spacer()' ile dolduruyoruz!
                
                Button(action: {
                    isNight.toggle()
                }, label: {
                    WeatherButton(title: "Change Time of Day",
                                  textColor: .blue,
                                  backgroundColor: .white)
                })
                
                Spacer()       // Geri kalan kısmı 'boşluk = Spacer()' ile dolduruyoruz!
            }
        }
    }
}

// EXTRACTED SUBVIEW
struct WeatherDayView: View {
    
    var dayOfWeek: String
    var systemImageName: String
    var temperature: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Text(dayOfWeek)
                .font(.system(size: 25, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: systemImageName)
                .symbolRenderingMode(.multicolor)       // .multicolor == .renderingMode(.original)
                .resizable()
//                .foregroundStyle(.blue, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
        
        
        // if we want to simple, default iOS gradient -> use ContainerRelativeShape()
        // mostly using on Buttons..
//        ContainerRelativeShape()
//            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
//            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .bold))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}
