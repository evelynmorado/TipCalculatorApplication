//
//  ContentView.swift
//  TipCalculator
//
//  Created by Evelyn Morado on 1/3/24.
//

import SwiftUI


struct ContentView: View {
    @State private var enteredAmount: String = ""
    @State private var tipAmount: Double = 0
    @State private var totalAmount: Double = 0
    @State private var tipSlider: Double = 20
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                VStack{
                    Text("Enter Bill Amount")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    TextField("0.00", text: $enteredAmount)
                        .font(.system(size: 40, weight: .semibold, design: .rounded))
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                .padding(.top, 230)
                
                Text("Tip: \(tipSlider, specifier: "%.0f")%")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Slider(value: $tipSlider, in: 0...100, step: 1)
                    .tint(Color.white)
                    .onChange(of: tipSlider) {
                        guard let amount = Double(enteredAmount) else {
                            print("Invalid Entry")
                            return
                        }
                        
                        guard let tip = Calculation().calculateTip(of: amount, with: tipSlider) else {
                            print("Bill amount or tip cannot be negative")
                            return
                        }
                        
                        tipAmount = tip
                        totalAmount = amount + tipAmount
                    }
                
                VStack {
                    Text("Tip:")
                        .foregroundColor(.white)
                        .font(.title)
                    Text(tipAmount, format: .currency(code: "USD"))
                        .font(.title.bold())
                        .foregroundColor(.white)
                }
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(LinearGradient(colors: [Color("Yellow"), Color("Orange"), Color("Pink")], startPoint: .topTrailing, endPoint: .bottomTrailing))
                        .frame(width: 130, height: 80, alignment: .center)
                }
                .padding(.top, 20)
                
                VStack {
                    Text("Total:")
                        .foregroundColor(.white)
                        .font(.title)
                    Text(totalAmount, format: .currency(code: "USD"))
                        .font(.title.bold())
                        .foregroundColor(.white)
                }
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(LinearGradient(colors: [Color("Yellow"), Color("Orange"), Color("Pink")], startPoint: .topTrailing, endPoint: .bottomTrailing))
                        .frame(width: 130, height: 80, alignment: .center)
                }

            }
            .padding(30)
        }
        .background(LinearGradient(colors: [Color("Pink"), Color("Orange"), Color("Yellow")], startPoint: .topTrailing, endPoint: .bottomTrailing))
        .ignoresSafeArea()

    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

struct Calculation {
    func calculateTip(of enteredAmount: Double, with tip: Double) -> Double? {
        guard enteredAmount >= 0 && tip >= 0 else { return nil }
        let tipPercentage = tip / 100
        return enteredAmount * tipPercentage
        
    }
}

