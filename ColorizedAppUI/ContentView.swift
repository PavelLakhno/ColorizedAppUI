//
//  ContentView.swift
//  ColorizedAppUI
//
//  Created by user on 12.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            VStack(spacing: 40) {
                Color(red: red / 255, green: green / 255, blue: blue / 255)
                    .frame(height: 150)
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 2)
                    )
                VStack {
                    SliderColorView(value: $red, color: .red)
                    SliderColorView(value: $green, color: .green)
                    SliderColorView(value: $blue, color: .blue)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            isFocused = false
                        }
                    }
                }
                .focused($isFocused)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
