//
//  MavPitch.swift
//  SocialCodingIos
//
//  Created by Betim Hodza on 6/1/24.
//

import SwiftUI

struct MavPitch: View {
    
    @Binding var presentSideMenu: Bool
    
    let logoImages = ["CSEC_LOGO", "ACM_logo", "GDC_logo", "MOBI_logo"]
    
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
            
            
            HStack (alignment: .top) {
                VStack (alignment: .center) {
                    //title
                    Text("✨ MavPitch ✨")
                        .font(.title)
                    
                    //description
                    Text("A competition to win $40,000 to turn your idea into a reality!!")
                        .font(.headline)
                        .padding(.top, 5)
                    Text("Mobi members have a habit of teaming up to win and fund their own startups.")
                        .font(.body)
                        .padding(.top, 2)
                    Text("These are resources provided by clubs like Mobi, ACM, GDC, and CSEC to help engineering students entering the MavPitch!")
                        .font(.body)
                        .padding(.top, 2)
                    
                    //Scrolling img of quadrangle logos
                    HorizontalImageScroll(imageNames: logoImages)
                        .frame(height: 120)
                        .padding(.top, 10)
                }

            }
            
                        
            Spacer()
            
            
        }
        .padding(.horizontal, 24)
    }
}

struct HorizontalImageScroll: View {
    let imageNames: [String]
    
    @State private var scrollOffset: CGFloat = 0
    @State private var scrollViewWidth: CGFloat = 0
    
    var body: some View {
        GeometryReader { geomtry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 20) {
                    ForEach(imageNames, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding()
            }
            .offset(x: scrollOffset, y: 0)
            .onAppear {
                scrollViewWidth = geomtry.size.width
                startScrolling()
            }
        }
    }
    
    private func startScrolling() {
        let scrollDurration: Double = Double(imageNames.count) * 5 //adjust speed
        withAnimation(.linear(duration: scrollDurration).repeatForever(autoreverses: true)) {
            scrollOffset = -scrollViewWidth //adjusts scroll direction
        }
    }
}
