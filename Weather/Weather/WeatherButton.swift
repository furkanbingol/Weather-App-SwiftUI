//
//  WeatherButton.swift
//  Weather
//
//  Created by Furkan Bingöl on 2.12.2023.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .foregroundStyle(textColor)
            .background(backgroundColor.gradient)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}

// If we want to use preview for components
struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Test Title",
                      textColor: .white,
                      backgroundColor: .blue)
    }
}
