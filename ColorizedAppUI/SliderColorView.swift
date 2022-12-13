//
//  SliderColorView.swift
//  ColorizedAppUI
//
//  Created by user on 12.12.2022.
//

import SwiftUI

struct SliderColorView: View {
    @Binding var value: Double
    @State private var text = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 35)
                .multilineTextAlignment(.trailing)
            
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) {
                    text = "\(lround($0))"
                }
            
            TextFieldView(text: $text, value: $value)
                .onAppear {
                    text = "\(lround(value))"
                }
        }

    }
}

struct SliderColorView_Previews: PreviewProvider {
    static var previews: some View {
        SliderColorView(value: .constant(0), color: .red)
    }
}
