//
//  square.swift
//  SocialCodingIos
//
//  Created by Betim Hodza on 7/27/24.
//

import SwiftUI

struct squareApp: CustomApp {
    let id = UUID()
    let name = "square"
    let icon = "square_icon"
    var view: AnyView {
        AnyView(
            VStack {
                HStack(alignment: .top) {
                    Text("square!")
                        .font(.largeTitle)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .aspectRatio(1.0, contentMode: .fit)
                        .foregroundColor(.mintBlue)
                    
                    Spacer()
                    
                }
                .padding()
                
                Spacer()
            }
        )
    }
}
