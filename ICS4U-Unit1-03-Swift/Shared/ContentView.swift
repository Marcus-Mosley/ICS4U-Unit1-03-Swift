//
// ContentView.swift
// ICS4U-Unit1-03-Swift
//
// Created by Marcus A. Mosley on 2021-01-20
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

let lightspeed:Double = 299792458

struct ContentView: View {
    @State var energy = 0
    @State var mass: String = ""
    @State var showingAlert = false
    
    var body: some View {
        VStack {
            TextField("Enter the mass of the object (kg): ", text: $mass)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                .keyboardType(.numberPad)
            Button(action: {
                if Double(mass) != nil && Double(mass)! > 0 {
                    energy = Int(Double(mass)! * pow(lightspeed, 2.0))
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .scientific
                    formatter.positiveFormat = "0.####E+0"
                    formatter.exponentSymbol = "e"
                    if let scientificFormatted = formatter.string(for: energy) {
                        print("That object could release \(scientificFormatted) Joules of energy.")
                    }
                } else {
                    showingAlert = true
                }
            }) {
                Text("Click Here")
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Important Message"), message: Text("Not Valid Input"), dismissButton: .default(Text("Got It!")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
