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
    @State private var alertPresented = false
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 35, alignment: .leading)
            
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) {
                    text = lround($0).formatted()
                }
            
            TextFieldView(text: $text, value: $value, action: checkValue)
                .alert("Wrong Format", isPresented: $alertPresented, actions: {}) {
                    Text("Please enter correct value")
                }
                .onAppear {
                    text = lround(value).formatted()
                }
        }

    }
    
    private func checkValue() {
        if let newValue = Double(text), (0...255).contains(newValue) {
            self.value = newValue
            return
        }
        alertPresented.toggle()
        value = 0
        text = "0"
    }
}

struct SliderColorView_Previews: PreviewProvider {
    static var previews: some View {
        SliderColorView(value: .constant(0), color: .red)
    }
}
