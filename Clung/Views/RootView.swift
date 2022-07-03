//  RootView.swift
//  Clung

//  Created by Dhruv Gupta on 28/06/22.


import SwiftUI

struct RootView: View {
    @EnvironmentObject var authVM: AuthVM
    
    // Initialising default tab
    @State var selectedTab: tabs = .chatsView
    
    // Property that keeps control of whether to show the onboarding sequence
    @State var isOnboarding = !AuthVM.isUserLoggedIn()

    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(Font.custom("Ubuntu-Bold", size: 20))
                .padding()
            Spacer()
            CustomTabBar(selectedTab: $selectedTab)
        }.background(Color("Background Color"))
         .fullScreenCover(isPresented: $isOnboarding) {
                // TODO: On dismiss
            } content: {
                
                // Onboarding sequence
                ContainerView(isOnboarding: $isOnboarding)
            }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

