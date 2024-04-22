//
//  SliderView.swift
//  Colorized
//
//  Created by Владислав Соколов on 19.04.2024.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var sliderValue: Double
    @State private var textValue = ""
    @State private var isPresented = false
    
    let sliderColor: Color
    
    var body: some View {
        HStack {
            Text(lround(sliderValue).formatted())
                .frame(width: 35, height: 10)
                .foregroundStyle(.white)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(sliderColor)
                .onChange(of: sliderValue) {
                    textValue = sliderValue.formatted()
                }
            
            TextFieldView(textValue: $textValue, isPresented: $isPresented, sliderValue: $sliderValue)
        }
        .onAppear {
            textValue = "\(lround(sliderValue))"
        }
    }
}

struct TextFieldView: View {
    @Binding var textValue: String
    @Binding var isPresented: Bool
    @Binding var sliderValue: Double
    
    var body: some View {
        TextField("", text: $textValue) { _ in
            withAnimation { checkValue() }
        }
        .font(.system(size: 16))
        .background(.white)
        .textFieldStyle(.roundedBorder)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(width: 45)
        .multilineTextAlignment(.trailing)
        .keyboardType(.numberPad)
        .alert("Wrong format", isPresented: $isPresented, actions: {}) {
            Text("Please, enter number from 0 to 255")
        }
    }
    
    private func checkValue() {
        if let value = Double(textValue), (0...255).contains(value) {
            sliderValue = value
            return
        }
        isPresented.toggle()
        sliderValue = 0.0
        textValue = "0"
    }
}


#Preview {
    ColorSliderView(sliderValue: .constant(20), sliderColor: .red)
}
