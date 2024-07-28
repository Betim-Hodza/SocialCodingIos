import SwiftUI

//protocol for custom apps, each custom app needs this
protocol CustomApp: Identifiable {
    var id: UUID { get }
    var name: String { get }
    var icon: String { get }
    var view: AnyView { get }
}

// Example of a custom app implementation (the real app is in UserApps folder)
//struct CalculatorApp: CustomApp {
//    let id = UUID()
//    let name = "Calculator"
//    let icon = "calculator_icon"
//    var view: AnyView {
//        AnyView(
//            VStack {
//                HStack(alignment: .top) {
//                    Text("Calculator Example!")
//                        .font(.largeTitle)
//                    Spacer()
//                }
//                .padding()
//                
//                Spacer()
//            }
//        )
//    }
//}

// Main Apps view

struct Apps: View {
    @Binding var presentSideMenu: Bool
    @State private var apps: [any CustomApp] = []
    @State private var currentApp: (any CustomApp)?
    @State private var appsLoaded = false
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
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
            
            //if within an app, allow a button to exit to the grid, else show the grid
            if let currentApp = currentApp {
                VStack {
                    currentApp.view
                    Button("Back to Grid") {
                        self.currentApp = nil
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            } else {
                ScrollView {
                    Text("Custom User Apps create by MOBI Members!")
                        .font(.headline)
                        .padding(.vertical)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(apps, id: \.id) { app in //explicitly tell swift to identifiy each app by id
                            AppIcon(app: app) {
                                currentApp = app
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 24)
        .onAppear {
            // load custom apps here
            if !appsLoaded { //we load apps only 1 time
                loadCustomApps()
                appsLoaded = true
            }
        }
    }
    private func loadCustomApps() {
        //Here is where you can dynamically load/register apps
        //e.g. we will add the calculator app here
        apps.append(CalculatorApp())
        //you can add more as you develop them!
        apps.append(squareApp())
    }
}

struct AppIcon: View {
    let app: any CustomApp
    let action: () -> Void
    
    var body: some View {
        VStack {
            
            Image(app.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
            Text(app.name)
                .font(.caption)
        }
        .frame(width: 80, height: 80)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .onTapGesture(perform: action)
    }
}

struct Apps_Previews: PreviewProvider {
    static var previews: some View {
        Apps(presentSideMenu: .constant(false))
    }
}
