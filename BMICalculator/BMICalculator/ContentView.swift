//
//  ContentView.swift
//  BMICalculator
//
//  Created by Mac on 12/28/20.
//

import SwiftUI

struct ContentView: View {
    @State var name = "Adnan"
   // @Binding var BMI: String
    var body: some View {
        
        ZStack{
            NavigationView{
                VStack{
                    
                    
                    Text("My name : \(name)").modifier(BMITextFieldMod())
                    Text("BMI: ").modifier(BMITextFieldMod())
                    Text("Status: ").modifier(BMITextFieldMod())
                    NavigationLink(
                        destination: BMI(),
                        label: {
                            Text("Press").padding().foregroundColor(.white).background(Color(#colorLiteral(red: 0.2558337152, green: 0.583994925, blue: 0.9943234324, alpha: 1))).cornerRadius(25)
                        })
                    
                        
                    
                        
                    
                }
                
            }
        }
        
    }
}
struct BMI: View {
    @State var height: String = ""
    @State var weight: String = ""
    @State var bmi: Double = 0
    var body: some View{
        VStack{
            
            Text("مرحبا بك بحاسبه الBMI").modifier(BMITextFieldMod())
            TextField("height", text: $height)
            TextField("weight", text: $weight)
            Button(action: {
                
                bmi = BMICAL(height: height, weight: weight)
                height = ""
                weight = ""
                
            }, label: {
                Text("احسب").modifier(BMITextFieldMod())
            })
            
            
            Text(String(bmi)).modifier(BMITextFieldMod())
        }
    }
}

func BMICAL(height: String , weight: String) -> Double {
    let hInt = Double(height)!
    let wInt = Int(weight)!
    
    let bmi = Double(wInt) / ( hInt*hInt )
    return bmi
}

struct BMITextFieldMod : ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 40, weight: .bold, design: .rounded))
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        BMI()
    }
}
