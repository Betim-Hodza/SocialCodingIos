//
//  Home.swift
//  SocialCodingIos
//
//  Created by Betim Hodza on 6/1/24.
//

import SwiftUI
import Foundation

struct Home: View {
    
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
            
            //MOBI LOGO
            Image("MOBI_logo")
                .imageScale(.small)
                .clipShape(.circle)
                .overlay(
                    Circle()
                        .stroke(Color.mobiBorder, lineWidth: 4)
                )
            
            //MOBI Slanted Rectangle Tag
            MOBIRec(title: "MOBI", tagline: "Disocver the magic of making apps!")
            
            //Become a member Rect button
            MOBIRecBttn(url: "https://discord.com/invite/pjjgRC7ErT", text: "Become a MOBI Member! 🚀")
            
            //Social Media Buttons
            
            HStack {
                //Youtube
                MOBISocialsBttn(url: "https://youtube.com/@mobibyte", img: "Youtube")
                //Instagram
                MOBISocialsBttn(url: "https://www.instagram.com/codewithmobi", img: "Instagram")
                //Github
                MOBISocialsBttn(url: "https://www.github.com/mobibyte", img: "Github")
                //FaceBook
                MOBISocialsBttn(url: "https://www.facebook.com/codewithmobi", img: "Facebook")
            }
            .padding(.horizontal, 10)
            
            Spacer()
            
            
        }
        .padding(.horizontal, 24)
    }
}

//MOBI Rectangle Tag
struct MOBIRec: View {
    
    let title: String
    let tagline: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill( LinearGradient(
                    colors: [.white, .mintBlue],
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .stroke(Color.mobiBorder, lineWidth: 2)
                .frame(width: 330, height: 150)
            
            VStack{
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                
                Text(tagline)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .padding(.horizontal, 5)
            }
        }
        .padding(.top, 15)
    }
}

struct MOBIRecBttn: View {
    
    let url: String
    let text: String
    
    var body: some View {
        
        Link(destination: URL(string: url)!) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill( LinearGradient(
                        colors: [.lightDarkBlue, .lillypurple],
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .stroke(Color.mobiBorder, lineWidth: 2)
                    .frame(width: 330, height: 100)
                
                Text(text)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
}

struct MOBISocialsBttn: View {
    
    let url: String
    let img: String
    
    var body: some View {
        Link(destination: URL(string: url)!) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .stroke(Color.mobiBorder, lineWidth: 2)
                    .frame(width: 65, height: 65)
                
                Image(img)
            }
        }
    }
}
