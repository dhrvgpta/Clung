//  ReusableTabButton.swift
//  Clung

//  Created by Dhruv Gupta on 29/06/22.


import SwiftUI

struct ReusableTabButton: View {
    var isSelected: Bool
    var imageName: String
    var subText: String
    
    var body: some View {
        
        /// Contained in a geometry reader to occupy max. possible space thereby not causing it to dynamically change with the introduction of a small rect. showing the selected tab
        GeometryReader{ geo in
            VStack{
                
                /// Small rectangular highlighter for selected tab
                if isSelected{
                    Rectangle()
                        .frame(width: geo.size.width , height: 2)
                        .foregroundColor(Color("Primary Color"))
                        .padding(.bottom, 1)
                }
                
                Spacer()
                
                /// Image
                Image(imageName)
                    .resizable()
                    .frame(width: 30, height: 30)
                
                
                /// Text
                Text(subText)
                    .font(Font.custom("Ubuntu-Bold", size: 13))
                    .frame(width: 60)
                
            }.frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
        }
    }
}

struct ReusableTabButton_Previews: PreviewProvider {
    static var previews: some View {
        ReusableTabButton(isSelected: true, imageName: "Chats", subText: "Chats")
    }
}
