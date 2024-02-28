//
//  Model.swift
//  MultiConverter-IOS
//
//  Created by Eric on 8/2/24.
//

import Foundation
import SwiftUI


public class Model{
    
    public enum OperationType{
        
        case none, height, distance, liquid, temperature, weight
        
    }
    
    
    public static func conversionAction(measure: inout Double, swap: Bool) -> Double {
        
        
        switch MainView.data {
            
        case .none:
            
            break
            
        case .height:
            
            if !swap {
                
                //Cm to Feet:
                measure = measure / 30.48
                
            } else {
                
                //Feet to Cm:
                measure = measure * 30.48
                
            }
            
            MainView.data = .none
            
            break
            
        case .distance:
            
            if !swap {
                
                //Km to Miles
                measure = measure / 1.60934
                
            } else {
                
                //Miles to Km
                measure = measure * 1.60934
                
            }
            
            MainView.data = .none
            
            break
            
        case .liquid:
            
            if !swap {
                
                //Ml to Ounces
                measure = measure / 29.5735
                
            } else {
                
                //Ounces to Ml
                measure = measure * 29.5735
                
            }
            
            MainView.data = .none
           
            break
            
        case .temperature:
            
            if !swap {
                
                //Celsius to Fahrenheit
                measure = (measure * 9 / 5) + 32
                
            } else {
                
                //Fahrenheit to Celsius
                measure = (measure-32) * 5 / 9
            }
            
            MainView.data = .none
            
            break
            
        case .weight:
            
            if !swap {
                
                //Kilos to Pounds
                measure = measure * 2.20462
                
            } else {
                
                //Pounds to Kilos
                measure = measure / 2.20462
                
            }
            
            MainView.data = .none
            
            break
           
        }
        
        
        
        return measure
    }
    
    //This method is to clean the total result, showing just 2 decimals, just in case they're different than 0
     public static func cleanTotal(theResult: inout Double) -> Double {
         
         
         var stringResult: String = ""
         let last = String(theResult).last!
         
         
         if stringResult.contains(".0") && last != "0" {
             stringResult = String(format: "%.2f", theResult)
         } else if stringResult.contains(".00") || stringResult.contains(".0"){
               stringResult = String(format: "%.0f", theResult)
         } else {
             stringResult = String(format: "%.2f", theResult)
         }
         
         theResult = Double(stringResult)!
         
         return theResult
     }
     
    
    
    //This method sends a message to the user in case he taps the coma more than once in the same number
    public static func decimalCheck(currentNumber: Binding<Double?>) -> Bool {
        
            func stringValue(from binding: Binding<Double?>) -> String {
                
                if let value = binding.wrappedValue {
                    return String(value)
                } else {
                    return "Nothing"
                }
            }
        
            
            let strNumber: String = stringValue(from: currentNumber)
            var checked = true
            var counter = 0
        
        
            for x in strNumber {
                if x == "," || x == "."{
                    counter += 1
                }
            }
            
            if counter > 1 {
                checked = false
            } else {
                checked = true
                print(counter)
                print(strNumber)
            }
            
            
            return checked
            
        }
    
    }
    

