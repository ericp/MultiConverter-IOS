//
//  Conversion.swift
//  MultiConverter-IOS
//
//  Created by Eric on 7/2/24.
//


import SwiftUI

struct Conversion: Identifiable {
    
    let id = UUID()
    var imageName: String
    var darkImage: String
    let title: String
    let types: String
    @State var inputType: String
    @State var outputType: String
    @State var inputAcr: String
    @State var outputAcr: String
    
}

struct ConversionList {
    
    
    static let theConversions = [
        
        Conversion(imageName: "height", darkImage: "darkBody", title: "HEIGHT", types: "Centimeters / Feet and Inches", inputType: "Centimeters", outputType: "Feet", inputAcr: "🇪🇺 cm", outputAcr: "🇺🇸ft"),
        Conversion(imageName: "distance", darkImage: "darkDistance", title: "DISTANCE", types: "Kilometers / Miles", inputType: "Kilometers", outputType: "Miles", inputAcr: "🇪🇺 km", outputAcr: "🇺🇸 mi"),
        Conversion(imageName: "liquid", darkImage: "darkLiquid", title: "LIQUID", types: "Milliliters / Fluid Ounces", inputType: "Milliliters", outputType: "Ounces", inputAcr: "🇪🇺 ml", outputAcr: "🇺🇸 fl.Oz."),
        Conversion(imageName: "temperature", darkImage: "darkTemperature", title: "TEMPERATURE", types: "Celcius / Fahrenheit", inputType: "Celcius", outputType: "Fahrenheit", inputAcr: "🇪🇺 Cº", outputAcr: "🇺🇸 Fº"),
        Conversion(imageName: "weight", darkImage: "darkWeight", title: "WEIGHT", types: "Kilograms / American pounds (lbs)", inputType: "Kilograms", outputType: "Pounds", inputAcr: "🇪🇺 kl", outputAcr: "🇺🇸 lbs")
    
    
    
    ]
    
    
}

