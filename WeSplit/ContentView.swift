//
//  ContentView.swift
//  WeSplit
//
//  Created by Ahad Islam on 3/21/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var tipPercentage = 2
    @State private var strNumberOfPeople = ""
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var numberOfPeople: Int {
        Int(strNumberOfPeople) ?? 0
    }
    
    var total: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        
        return orderAmount + tipValue
    }
    
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of people", text: $strNumberOfPeople)
                        .keyboardType(.numberPad)
                }
            
            
            Section(header: Text("How much tip do you want to leave?")) {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0 ..< tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
            }
            
            Section(header: Text("Amount per person")) {
                Text("$\(totalPerPerson, specifier: "%.2f")")
            }
            
            Section {
                Text("Total: $\(total, specifier: "%.2f")")
            }
        }
        .navigationBarTitle("WeSplit")
    }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
