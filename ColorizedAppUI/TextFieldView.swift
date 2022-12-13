//
//  TextFieldView.swift
//  ColorizedAppUI
//
//  Created by user on 12.12.2022.
//

import SwiftUI


struct TextFieldView: View {
    @Binding var text: String
    @Binding var value: Double
    
    @State private var alertPresented = false
    
    var body: some View {
        TextField("", text: $text) { _ in
            checkValue()
        }
        .textFieldStyle(.roundedBorder)
        .frame(width: 55)
        .multilineTextAlignment(.trailing)
        .keyboardType(.numberPad)
        .alert("Wrong Format", isPresented: $alertPresented, actions: {}) {
            Text("Please enter correct value")
        }
    }
}

extension TextFieldView {
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

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant("0"), value: .constant(0))
    }
}
