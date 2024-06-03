//
//  ContentView.swift
//  SocialCodingIos
//
//  Created by Betim Hodza on 6/1/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    //reminscient of mutable state
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    //Tells ios to display a screen
    var body: some View {
        //think of the z axis as being the depth, each view is at a different layer indicated by tag #
        ZStack {
            TabView(selection: $selectedSideMenuTab) {
                Home(presentSideMenu: $presentSideMenu)
                    .tag(0)
                About(presentSideMenu: $presentSideMenu)
                    .tag(1)
                Events(presentSideMenu: $presentSideMenu)
                    .tag(2)
                Apps(presentSideMenu: $presentSideMenu)
                    .tag(3)
                MavPitch(presentSideMenu: $presentSideMenu)
                    .tag(4)
            }
            
            // tells if side menu is showing
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}

struct SideMenu: View {
    @Binding var isShowing: Bool
    var content: AnyView
    var edgeTransition: AnyTransition = .move(edge: .leading)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (isShowing) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                content
                    .transition(edgeTransition)
                    .background(
                        Color.clear
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}

enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case about
    case events
    case apps
    case mavpitch
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .about:
            return "About Us"
        case .events:
            return "Events"
        case .apps:
            return "Apps"
        case .mavpitch:
            return "MavPitch"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "Home"
        case .about:
            return "Chat"
        case .events:
            return "Events"
        case .apps:
            return "Apps"
        case .mavpitch:
            return "MavPitch"
        }
    }
}

struct SideMenuView: View {
    
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        HStack {
            
            ZStack {
                Rectangle()
                    .fill(Color.sidebar)
                    .frame(width: 270)
                    .shadow(color: .purple.opacity(0.1), radius: 5, x: 0, y: 3)
                
                VStack(alignment: .leading, spacing: 0) {
                    ProfileImageView()
                        .frame(height: 140)
                        .padding(.bottom, 30)
                    
                    ForEach(SideMenuRowType.allCases, id: \.self) { row in
                        RowView(isSelected: selectedSideMenuTab == row.rawValue, imageName: row.iconName, title: row.title) {
                            selectedSideMenuTab = row.rawValue
                            presentSideMenu.toggle()
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, 100)
                .frame(width: 270)
                .background(
                    Color.sidebar
                )
            }
            
            Spacer()
        }
        .background(.clear)
    }
    
    func ProfileImageView() -> some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Image("momo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .overlay (
                        RoundedRectangle (cornerRadius: 50)
                            .stroke(.purple.opacity(0.5), lineWidth: 10)
                    )
                    .cornerRadius(50)
                Spacer()
            }
            
            Text("MOBI")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.mobiBorder)
            
            Text("Magic of Making Apps")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.mobiBorder.opacity(0.5))
            
        }
    }
    
    
    func RowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View {
        Button {
            action()
        } label: {
            VStack (alignment: .leading) {
                HStack(spacing: 20){
                    Rectangle()
                        .fill(isSelected ? .purple : .sidebar)
                        .frame(width: 5)
                    
                    ZStack{
                        Image(imageName)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(isSelected ? .black : .gray)
                            .frame(width: 26, height: 26)
                    }
                    .frame(width: 30, height: 30)
                    Text(title)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(isSelected ? .black : .gray)
                    Spacer()
                }
            }
        }
        .frame(height: 50)
        .background(
            LinearGradient(colors: [isSelected ? .purple.opacity(0.5) : .sidebar, .sidebar], startPoint: .leading, endPoint: .trailing)
        )
    }
    
}


#Preview {
    ContentView()
}
