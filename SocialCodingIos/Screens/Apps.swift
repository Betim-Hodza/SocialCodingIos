//
//  Apps.swift
//  SocialCodingIos
//
//  Created by Betim Hodza on 6/1/24.
//

import SwiftUI

struct Apps: View {
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image("Menu")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
                
            }
            
            Spacer()
            Text("Custom User Apps create by Mobi Members!")
            Spacer()
            
        }
        .padding(.horizontal, 24)
    }
}
