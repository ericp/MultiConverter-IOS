//
//  MainView.swift
//  MultiConverter-IOS
//
//  Created by Eric on 6/2/24.
//

import SwiftUI

struct MainView: View {
    
    public static var data:  Model.OperationType = .none
    @State private var sourceMeasureIndex = 0
    @State private var targetLanguageIndex = 1
    @State private var inputText: Double!
    @State private var outputText: Double!
    @State var conversion: Conversion
    @State public var swap: Bool = false
    @State var result: String = ""
    @State private var keyboardHeight: CGFloat = 0
    @State private var amount: Double = 0
    @State var isShowingAlert = false
    @Environment(\.colorScheme) var colorScheme
    
    
   
    var body: some View {
        ScrollView{
                ZStack{
                    VStack{
                        HStack{
                            Text("Measure Conversion")
                                .font(.system(size: 25))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                        
                        VStack{
                            Rectangle()
                                .frame(width: 373, height: 1)
                        }
                        
                        
                        Spacer()
                        
                        HStack{
                            
                            if !swap {
                                Text(conversion.inputAcr)
                                    .fontWeight(.bold)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    .padding()
                                    .frame(width: 150)
                                
                            } else {
                                Text(conversion.outputAcr)
                                    .fontWeight(.bold)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    .padding()
                                    .frame(width: 150)
                                
                            }
                            
                            Button (action: {
                                
                                if !swap {
                                    swap = true
                                    print("IN FALSE")
                                    print(swap)
                                    
                                } else if swap {
                                    swap = false
                                    print("IN TRUE")
                                }
                                
                                
                            }, label: {
                                Image(colorScheme == .dark ? "darkTranslate" : "translate")
                                    .resizable()
                                
                            })
                            .frame(width: 30, height: 30)
                            .padding()
                            
                            
                            if !swap {
                                Text(conversion.outputAcr)
                                    .fontWeight(.bold)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    .padding()
                                    .frame(width: 150)
                                
                                
                            } else {
                                
                                Text(conversion.inputAcr)
                                    .fontWeight(.bold)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    .padding(.trailing)
                                    .frame(width: 150)
                                
                            }
                            
                        }
                        .padding(.bottom)
                        Spacer()
                        
                        VStack{
                            if !swap {
                                Text("Introduce " + conversion.inputType)
                                    .font(
                                        Font.custom("Inter", size: 17)
                                            .weight(.heavy)
                                        
                                    )
                                    .padding()
                                    .foregroundColor(.gray)
                                
                                
                                
                            } else {
                                Text("Introduce " + conversion.outputType)
                                    .font(
                                        Font.custom("Inter", size: 17)
                                            .weight(.light)
                                    )
                                    .padding()
                                    .foregroundColor(.gray)
                                
                            }
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .frame(width: 373, height: 108)
                                    .background(Color(red: 0.14, green: 0.15, blue: 0.15))
                                    .cornerRadius(22)
                                
                                TextField("", value: $inputText, format: .number)
                                    .font(
                                        Font.custom("Inter", size: 35)
                                    )
                                    .padding()
                                    .foregroundColor(.black)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                
                            }
                            .padding(.bottom)
                            
                            
                            Button("Convert", action: {
                                
                                if Model.decimalCheck(currentNumber: $inputText) {
                                    conversionType()
                                    hideKeyboard()
                                } else {
                                    isShowingAlert = true
                                    print("It's getting HERE")
                                }
                            })
                            .padding()
                            .background(Color(red: 0, green: 0.4, blue: 1))
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                           
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .bottomTrailing)
                        
                        
                        VStack {
                            if !swap {
                                Text("Conversion to " + conversion.outputType)
                                    .font(
                                        Font.custom("Inter", size: 17)
                                            .weight(.light)
                                    )
                                    .padding()
                                    .foregroundColor(.gray)
                                
                            } else {
                                Text("Conversion to " + conversion.inputType)
                                    .font(
                                        Font.custom("Inter", size: 17)
                                            .weight(.light)
                                    )
                                    .padding()
                                    .foregroundColor(.gray)
                                
                            }
                            
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .frame(width: 373, height: 108)
                                    .background(Color(red: 0.14, green: 0.15, blue: 0.15))
                                    .cornerRadius(22)
                                
                                
                                Text(result)
                                    .font(
                                        Font.custom("Inter", size: 35)
                                    )
                                    .foregroundColor(.white)
                                
                            }
                            
                        }
                        .padding(.bottom)
                        .padding()
                        .padding(.bottom)
                        Spacer()
                        
                    }
                }
                
            }
        .scrollDismissesKeyboard(.interactively)
    }
    
    func conversionType() {
        
        var transport: Double = 0
        
        if inputText != nil {
            if conversion.title == "HEIGHT" {
                MainView.data = .height
                transport = inputText
                outputText = Model.conversionAction(measure: &transport, swap: swap)
                outputText = Model.cleanTotal(theResult: &outputText)
            } else if conversion.title == "DISTANCE" {
                MainView.data = .distance
                transport = inputText
                outputText = Model.conversionAction(measure: &transport, swap: swap)
                outputText = Model.cleanTotal(theResult: &outputText)
            } else if conversion.title == "LIQUID" {
                MainView.data = .liquid
                transport = inputText
                outputText = Model.conversionAction(measure: &transport, swap: swap)
                outputText = Model.cleanTotal(theResult: &outputText)
            } else if conversion.title == "TEMPERATURE" {
                MainView.data = .temperature
                transport = inputText
                outputText = Model.conversionAction(measure: &transport, swap: swap)
                outputText = Model.cleanTotal(theResult: &outputText)
            } else if conversion.title == "WEIGHT" {
                MainView.data = .weight
                transport = inputText
                outputText = Model.conversionAction(measure: &transport, swap: swap)
                outputText = Model.cleanTotal(theResult: &outputText)
            } else {
                MainView.data = .none
            }
            
            result = String(outputText)
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

    }
}

#Preview {
    MainView(conversion: ConversionList.theConversions.first!)
}
 
