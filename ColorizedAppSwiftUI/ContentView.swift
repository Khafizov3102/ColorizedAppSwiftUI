//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Денис Хафизов on 16.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redColorTF = "128"
    @State private var redColorSliderValue = 128.0
    
    @State private var greenColorTF = "128"
    @State private var greenColorSliderValue = 128.0
    
    @State private var blueColorTF = "128"
    @State private var blueColorSliderValue = 128.0
    
    @State private var alertPresented = false
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Color(uiColor: UIColor(
                    red: redColorSliderValue / 255,
                    green: greenColorSliderValue / 255,
                    blue: blueColorSliderValue / 255,
                    alpha: 1)
                )
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                    .overlay(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).stroke(.white, lineWidth: 4))

                VStack {
                    ColorSliderView(sliderValue: $redColorSliderValue, ColorTF: $redColorTF, sliderColor: .red)
                    ColorSliderView(sliderValue: $greenColorSliderValue, ColorTF: $greenColorTF, sliderColor: .green)
                    ColorSliderView(sliderValue: $blueColorSliderValue, ColorTF: $blueColorTF, sliderColor: .blue)
                }
                .padding(.top, 30)
                    .alert(isPresented: $alertPresented) {
                        Alert(title: Text("Ошибка: число должно находиться в диапазоне от 0 до 255."))
                    }
                
                Spacer()
            }
            .padding(.top, 90)
            .padding(.horizontal, 16)
        }
        .keyboardType(.numberPad)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                HStack {
                    Spacer()
                    Button("done") {
                        doneButtonPressed()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    private func doneButtonPressed() {
        if let redColorValue = Double(redColorTF) {
            if (0...255).contains(redColorValue) {
                redColorSliderValue = redColorValue
            } else {
                alertPresented.toggle()
            }
        }
        
        if let greenColorValue = Double(greenColorTF) {
            if (0...255).contains(greenColorValue) {
                greenColorSliderValue = greenColorValue
            } else {
                alertPresented.toggle()
            }
        }
        
        if let blueColorValue = Double(blueColorTF) {
            if (0...255).contains(blueColorValue) {
                blueColorSliderValue = blueColorValue
            } else {
                alertPresented.toggle()
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
