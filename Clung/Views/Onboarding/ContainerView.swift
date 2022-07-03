//  ContainerView.swift
//  Clung

//  Created by Dhruv Gupta on 02/07/22.


import SwiftUI

enum OnboardingSteps: Int{
    case welcomeScreen = 0
    case phoneNumInput = 1
    case verification = 2
    case profileSetup = 3
    case syncContacts = 4
}

struct ContainerView: View {
    @Binding var isOnboarding: Bool
    @State var currentStep: OnboardingSteps = .welcomeScreen
    
    var body: some View {
        ZStack{
            Color("Background Color")
            switch currentStep {
                case .welcomeScreen:
                    WelcomeView(currentStep: $currentStep)
                case .phoneNumInput:
                    PhoneNumView(currentStep: $currentStep)
                case .verification:
                    VerificationView(currentStep: $currentStep)
                case .profileSetup:
                    ProfileSetupView(currentStep: $currentStep)
                case .syncContacts:
                SyncContactsView(isOnboarding: $isOnboarding, currentStep: $currentStep)
            }
        }.ignoresSafeArea()
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView(isOnboarding: .constant(true))
    }
}
