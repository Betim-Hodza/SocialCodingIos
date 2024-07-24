//
//  About.swift
//  SocialCodingIos
//
//  Created by Betim Hodza on 6/1/24.
//

import SwiftUI
import Foundation

struct About: View {
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        ScrollView {
            LazyVStack {
                
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
                
           
                //about us squares
                //abt us
                MOBIAbtUs(title: "About Us", text: "We're Mobi, an app development club just for you. We're a community of developer friends that are here to help you code and have fun!")
                
                Spacer() // Add a spacer to push the image to the right
                
                Image("mobi_about_us")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding() // Add padding around the image
                
                //MemberShip
                MOBIAbtUs(title: "MemberShip", text: "All of our events are completely free, so membership is free. We want to make sure no one is excluded in our events. If you would like to additionally support Mobi and its events, you can pur chase a membership package for a tshirt.")
                
                Spacer() // Add a spacer to push the image to the right
                
                Image("Membership")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Spacer()
                
                //Philosophy
                MOBIAbtUs(title: "Philosophy", text: "We’re a community-first group. You don’t have to be an engineer to code, and you don’t have to be super smart! Everyone can build! We’re just here to help you make it real.")
                
                Image("philosophy_photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Spacer()
                
                //Events
                
                MOBIAbtUs(title: "Events", text: "We have bunch of cool events happening throughout the semester, one of them being social coding. Bring your friends! You can particpate in our events just by coming in person!")
                
                Image("events_photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                
                
            }
            .padding(.horizontal, 24)
        }
        }
        
}

//MOBI about us
struct MOBIAbtUs: View {
    let title: String
    let text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.clear)
                .stroke(Color.mobiBorder, lineWidth: 2)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.largeTitle)
                        .foregroundColor(.mobiBorder)
                        .padding(.bottom, 5)
                    
                    Text(text)
                        .font(.subheadline)
                        .foregroundColor(.mobiBorder)
                        .padding(.horizontal, 5)
                    
                    Spacer() // Add a spacer to push the image down
                }
                .padding() // Add padding around the text
            }
        }
        .padding()
    }
}
