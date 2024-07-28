//
//  Calculator.swift
//  SocialCodingIos
//
//  Created by Betim Hodza on 7/27/24.
//

import SwiftUI

func calculate() {
    
}

struct CalculatorApp: CustomApp {
    let id = UUID()
    let name = "Calculator"
    let icon = "calculator_icon"
    var view: AnyView {
        AnyView(
            VStack {
                HStack(alignment: .top) {
                    Text("Calculator Example!")
                        .font(.largeTitle)
                    Text("A real calculator app would be here, but I just developed this whole social coding app so im gonna take a break")
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
        )
    }
}
