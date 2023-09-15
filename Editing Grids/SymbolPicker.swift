//
//  SymbolPicker.swift
//  Editing Grids
//
//  Created by Михаил Куприянов on 15.9.23..
//

import SwiftUI

struct SymbolPicker: View {
    let columns = Array(repeating: GridItem(.flexible()), count: 4)
    
    let pickableSymbols = [
        Symbol(name: "tshirt"),
        Symbol(name: "eyes"),
        Symbol(name: "eyebrow"),
        Symbol(name: "nose"),
        Symbol(name: "mustache"),
        Symbol(name: "mouth"),
        Symbol(name: "eyeglasses"),
        Symbol(name: "facemask"),
        Symbol(name: "brain.head.profile"),
        Symbol(name: "brain"),
        Symbol(name: "icloud"),
        Symbol(name: "theatermasks.fill"),
        Symbol(name: "house.fill"),
        Symbol(name: "sun.max.fill"),
        Symbol(name: "cloud.rain.fill"),
        Symbol(name: "pawprint.fill"),
        Symbol(name: "lungs.fill"),
        Symbol(name: "face.smiling"),
        Symbol(name: "gear")
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(pickableSymbols) { symbol in
                    Image(systemName: symbol.name)
                        .resizable()
                        .scaledToFit()
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(.accentColor)
                        .ignoresSafeArea(.container, edges: .bottom)
                }
            }
        }
    }
}

#Preview {
    SymbolPicker()
}
