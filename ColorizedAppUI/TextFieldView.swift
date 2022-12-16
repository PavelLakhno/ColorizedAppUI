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
    var action: ()->Void
    
    @State private var alertPresented = false
    
    var body: some View {
        TextField("", text: $text) { _ in
            action()
        }
        .textFieldStyle(.roundedBorder)
        .frame(width: 55)
        .multilineTextAlignment(.trailing)
        .keyboardType(.numberPad)
    }
}


struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant("0"), value: .constant(0), action: {})
    }
}
