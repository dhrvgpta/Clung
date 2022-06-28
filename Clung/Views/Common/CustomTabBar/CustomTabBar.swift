//  CustomTabBar.swift
//  Clung

//  Created by Dhruv Gupta on 28/06/22.


import SwiftUI

enum tabs: Int{
    case chatsView = 0
    case contactsView = 1
}

struct CustomTabBar: View {
    @Binding var selectedTab: tabs
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 25){
            
            // MARK: Chats Button
            Button {
                selectedTab = .chatsView
                
                // TODO: Switch to ChatsGridView
                
            } label: {
                ReusableTabButton(isSelected: selectedTab == .chatsView, imageName: "Chats", subText: "Chats")
            }
            
            
            // MARK: Initiate Conversation Button
            Button {
                
                // TODO: Switch to ChatView
                
            } label: {
                
                // Not a tab so no geometry reader needed
                VStack{
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(Color("Primary Color"))
                        .scaledToFill()
                }
            }
            
            // MARK: Contacts Button
            Button {
                selectedTab = .contactsView
                
                // TODO: Switch to ContactsView
                
            } label:{
                ReusableTabButton(isSelected: selectedTab == .contactsView, imageName: "Female Profile", subText: "Contacts")
            }
        }
            .foregroundColor(.black)
            .frame(height: 80, alignment: .center)
            .padding(.horizontal, 40)
            .background(Color("Background Color"))
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.chatsView))
    }
}
