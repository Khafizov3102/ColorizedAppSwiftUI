//
//  ColorSliderView.swift
//  ColorizedAppSwiftUI
//
//  Created by Денис Хафизов on 16.12.2023.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var sliderValue: Double
    @Binding var ColorTF: String
    let sliderColor: Color
    
    var body: some View {
        HStack {
            Text(sliderValue.rounded().formatted())
                .foregroundStyle(.white)
                .frame(width: 40)
            Slider(value: $sliderValue, in: 0...255)
                .tint(sliderColor)
            TextField(text: $ColorTF) {
            }
            .foregroundStyle(.white)
            .frame(width: 40)
        }
    }
}

//#Preview {
//    ColorSliderView(sliderValue: .constant(50), ColorTF: .constant(""))
//}
