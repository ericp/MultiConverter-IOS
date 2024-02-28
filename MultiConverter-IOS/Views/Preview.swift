//
//  ContentView.swift
//  MultiConverter-IOS
//
//  Created by Eric on 6/2/24.
//

import SwiftUI

struct Preview: View {
    
    @State private var isActive = false
    @State private var size = 0.1
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            
            SelectionView()
            
        } else {
            VStack {
                VStack {
                    Image("preview")
                        .font(.system(size: 80))
                        .foregroundColor(.black)
                    Text("Multi Converter")
                        .font(Font.custom("Times New Roman", size: 56))
                        .foregroundColor(.black.opacity(0.80))
                }
                .background(.white)
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 2.0)){
                        self.size = 1.5
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.isActive = true
                }
            }
            .background(.white)
        }
    }
}

struct Content_Preview: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
