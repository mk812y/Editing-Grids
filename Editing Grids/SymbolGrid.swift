//
//  SymbolGrid.swift
//  Editing Grids
//
//  Created by Михаил Куприянов on 14.9.23..
//

import SwiftUI

struct SymbolGrid: View {
    @State private var isAddingSymbol = false
    @State private var isEditing = false
    
    private static let initialColumns = 3
    @State private var selectedSymbol: Symbol?
    @State private var numColumns = initialColumns
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    
    @State private var symbols = [
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
    ]
    
    var columnsText: String {
        numColumns > 1 ? "\(numColumns) Columns" : "1 Columns"
    }
    
    
    var body: some View {
        VStack {
            if isEditing {
                Stepper(columnsText, value: $numColumns, in: 1...6, step: 1) { _ in
                    withAnimation{
                        gridColumns = Array(repeating: GridItem(.flexible()), count: numColumns)
                    }
                }
            }
            
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(symbols) { symbol in
                        NavigationLink(destination: SymbolDetail(symbol: symbol)) {
                            ZStack(alignment: .topTrailing) {
                                Image(systemName: symbol.name)
                                    .resizable()
                                    .scaledToFit()
                                    .symbolRenderingMode(.hierarchical)
                                    .foregroundColor(.accentColor)
                                    .ignoresSafeArea(.container, edges: .bottom)
                                    .cornerRadius(8)
                                
                                if isEditing {
                                    Button {
//                                        guard symbols.firstIndex(of: symbol) != nil else { return }
                                        guard let index = symbols.firstIndex(of: symbol) else { return }
                                    } label: {
                                        Image(systemName: "xmark.squre.fill")
                                            .font(.title)
                                            .symbolRenderingMode(.palette)
                                            .foregroundStyle(.white, .red)
                                    }
                                    .offset(x: 7, y: -7)
                                }
                            }
                            .padding()
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .navigationTitle("My symbol")
        .navigationBarTitleDisplayMode(.inline)
//        .sheet(isPresented: $isAddingSymbol, onDismiss: addSymbol) {
//            SymbolP
//        }
    }
}

#Preview {
    SymbolGrid()
}
