//  WelcomeView.swift
//  Clung

//  Created by Dhruv Gupta on 02/07/22.


import SwiftUI

struct WelcomeView: View {
    @Binding var currentStep: OnboardingSteps
    
    var body: some View {
        VStack(spacing: 0){
            Spacer()
            Image("Onboarding 01")
                .resizable()
                .frame(width: 306, height: 319)
            Text("Welcome to Clung")
                .font(Font.custom("Ubuntu Bold", size: 24))
            Text("A fuss-free and secure chatting experience")
                .font(Font.custom("Ubuntu-Light", size: 15))
                .padding(.top, 10)
            Spacer()
            Button {
                currentStep = .phoneNumInput
            } label: {
                Text("Get Started")
            }
                .buttonStyle(OnboardingCustomButton())
            HStack(spacing: 0){
                Text("By tapping upon ")
                Text("Get Started")
                    .bold()
                Text(", you agree to our ")
                Text("Privacy Policy")
                    .foregroundColor(.blue)
            }.font(Font.custom("Ubuntu-Light", size: 10))
                .padding(.top, 10)
        }
            .padding(.horizontal, 20)
            .foregroundColor(.black)
            .padding(.bottom, 60)
        
    }
}

