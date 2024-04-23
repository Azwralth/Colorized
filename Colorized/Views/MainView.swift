//
//  ContentView.swift
//  Colorized
//
//  Created by Владислав Соколов on 19.04.2024.
//

import SwiftUI

struct MainView: View {
    @State private var redSlider = Double.random(in: 0...255)
    @State private var greenSlider = Double.random(in: 0...255)
    @State private var blueSlider = Double.random(in: 0...255)
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack(spacing: 40) {
            
            RoundedRectangleView(
                redColor: redSlider,
                greenColor: greenSlider,
                blueColor: blueSlider
            )
            
            VStack {
                ColorSliderView(sliderValue: $redSlider, sliderColor: .red)
                    .focused($focusedField, equals: .red)
                ColorSliderView(sliderValue: $greenSlider, sliderColor: .green)
                    .focused($focusedField, equals: .green)
                ColorSliderView(sliderValue: $blueSlider, sliderColor: .blue)
                    .focused($focusedField, equals: .blue)
            }
            Spacer()
        }
        .padding()
        .background(.gray)
        .onTapGesture {
            focusedField = nil
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button(action: nextField) {
                    Image(systemName: "chevron.down")
                }
                
                Button(action: previousField) {
                    Image(systemName: "chevron.up")
                }
                
                Spacer()
                Button("Done") {
                    focusedField = nil
                }
            }
        }
    }
}

private extension MainView {
    enum Field {
        case red
        case green
        case blue
    }
    
    func nextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
    
    func previousField() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
}

#Preview {
    MainView()
}
