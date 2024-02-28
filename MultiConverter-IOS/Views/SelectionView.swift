//
//  SelectionView.swift
//  MultiConverter-IOS
//
//  Created by Eric on 8/2/24.
//

import SwiftUI

struct SelectionView: View {
    
    var conversions: [Conversion] = ConversionList.theConversions
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
            NavigationView {
                List(conversions, id: \.id) { conversion in
                    NavigationLink(destination: MainView(conversion: conversion), label: {
                        HStack {
                                Image(colorScheme == .dark ? conversion.darkImage : conversion.imageName)
                                .frame(maxWidth: .pi)
                                .padding()
                                .padding(.trailing)
                            
                            
                            VStack (alignment: .leading){
                                Text(conversion.title)
                                    .fontWeight(.bold)
                                    .minimumScaleFactor(0.5)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text(conversion.types)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                            }
                            
                        }
                    })
                    .padding()
                    
                }
                .navigationTitle("Conversion Options")
        }
        
    }
    

}

#Preview {
    SelectionView()
}
