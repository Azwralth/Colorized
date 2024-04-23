//
//  RoundedRectangleView.swift
//  Colorized
//
//  Created by Владислав Соколов on 19.04.2024.
//

import SwiftUI

struct RoundedRectangleView: View {
    let redColor: Double
    let greenColor: Double
    let blueColor: Double
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(
                    Color(
                        red: redColor/255,
                        green: greenColor/255,
                        blue: blueColor/255
                    )
                )
                .frame(height: 150)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.white), lineWidth: 4))
        }
    }
}

#Preview {
    RoundedRectangleView(redColor: 20, greenColor: 20, blueColor: 20)
}
