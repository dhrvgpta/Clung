//  OnboardingCustomButton.swift
//  Clung

//  Created by Dhruv Gupta on 02/07/22.


import Foundation
import SwiftUI

struct OnboardingCustomButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("Secondary Color"))
            
            configuration.label
                .font(Font.custom("Ubuntu-Bold", size: 15))
        }
            .cornerRadius(20)
            .frame(height: 47)
            .padding(.bottom, 10)
    }
}
