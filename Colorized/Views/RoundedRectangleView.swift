//
//  RoundedRectangleView.swift
//  Colorized
//
//  Created by Владислав Соколов on 19.04.2024.
//

import SwiftUI

struct RoundedRectangleView: View {
    @Binding var redColor: Double
    @Binding var greenColor: Double
    @Binding var blueColor: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(Color(red: redColor/255, green: greenColor/255, blue: blueColor/255))
            .frame(width: 350, height: 150)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.white), lineWidth: 4))
    }
}

#Preview {
    RoundedRectangleView(redColor: .constant(25), greenColor: .constant(25), blueColor: .constant(25))
}
