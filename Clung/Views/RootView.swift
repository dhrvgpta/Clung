//  RootView.swift
//  Clung

//  Created by Dhruv Gupta on 28/06/22.


import SwiftUI

struct RootView: View {
    
    // Initialising default tab
    @State var selectedTab: tabs = .chatsView

    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(Font.custom("Ubuntu-Bold", size: 20))
                .padding()
            Spacer()
            CustomTabBar(selectedTab: $selectedTab)
        }.background(Color("Background Color"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

