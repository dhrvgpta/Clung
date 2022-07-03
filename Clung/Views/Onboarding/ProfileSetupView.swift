//  ProfileSetupView.swift
//  Clung

//  Created by Dhruv Gupta on 02/07/22.


import SwiftUI

struct ProfileSetupView: View {
    @State var userFirstName: String = ""
    @State var userLastName: String = ""
    @Binding var currentStep: OnboardingSteps
    
    var body: some View {
        ScrollView{
            Text("Setup your profile")
                .font(Font.custom("Ubuntu-Bold", size: 26))
            Text("Just a few more details about you to get everything started and ready to go")
                .multilineTextAlignment(.center)
                .font(Font.custom("Ubuntu-Light", size: 14))
                .lineSpacing(5)
                .padding(.top, 15)
            
            Button {
                
            } label: {
                ZStack{
                    Circle()
                        .foregroundColor(Color("Input Color"))
                    Circle()
                        .stroke(Color("Secondary Color"), lineWidth: 2)
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .foregroundColor(Color("Secondary Color"))
                }
                .frame(width: 180, height: 180)
                .padding(.vertical, 28)
            }
            
            // First Name
            ZStack{
                Rectangle()
                    .foregroundColor(Color("Input Color"))
                HStack{
                    TextField(text: $userFirstName) {
                        Text("First Name")
                            .font(Font.custom("Ubuntu-Medium", size: 14))
                    }
                    Spacer()
                    if userFirstName != ""{
                        Button {
                            userFirstName = ""
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                                .resizable()
                        }
                        .tint(Color(red: 0.691, green: 0.662, blue: 0.667))
                        .frame(width: 19, height: 19)
                    }
                }
                .padding()
            }
            .frame(height: 47)
            .cornerRadius(20)
            
            // Last Name
            ZStack{
                Rectangle()
                    .foregroundColor(Color("Input Color"))
                HStack{
                    TextField(text: $userLastName) {
                        Text("Last Name")
                            .font(Font.custom("Ubuntu-Medium", size: 14))
                        Spacer()
                        if userLastName != ""{
                            Button {
                                userLastName = ""
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                                    .resizable()
                            }
                            .tint(Color(red: 0.691, green: 0.662, blue: 0.667))
                            .frame(width: 19, height: 19)
                        }
                    }
                    .padding()
                }
            }
                .frame(height: 47)
                .cornerRadius(20)
            
            // Button
            Button {
                currentStep = .syncContacts
            } label: {
                Text("Next")
            }
            .buttonStyle(OnboardingCustomButton())
            .padding(.top, 150)
        }
            .padding(.horizontal, 20)
            .padding(.top, 100)
    }
}
        
struct ProfileSetupView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSetupView(currentStep: .constant(.profileSetup))
    }
}
