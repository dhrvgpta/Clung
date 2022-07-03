//  SyncContactsView.swift
//  Clung

//  Created by Dhruv Gupta on 02/07/22.


import SwiftUI

struct SyncContactsView: View {
    @Binding var isOnboarding: Bool
    @Binding var currentStep: OnboardingSteps
    
    
    var body: some View {
        VStack(spacing: 0){
            Spacer()
            Image("Onboarding 02")
                .resizable()
                .frame(width: 306, height: 319)
            Text("You’re all set!")
                .font(Font.custom("Ubuntu Bold", size: 24))
                .padding(.top, 30)
            Text("Go ahead, start a convo with your loved ones")
                .font(Font.custom("Ubuntu-Light", size: 15))
                .padding(.top, 10)
            Spacer()
            Button {
                isOnboarding = false
                currentStep = .welcomeScreen
            } label: {
                Text("Finish Setup")
            }
                .buttonStyle(OnboardingCustomButton())
        }
            .padding(.horizontal, 20)
            .foregroundColor(.black)
            .padding(.bottom, 20)
    }
}

struct SyncContactsView_Previews: PreviewProvider {
    static var previews: some View {
        SyncContactsView(isOnboarding: .constant(true), currentStep: .constant(.syncContacts))
    }
}
