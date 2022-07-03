//  PhoneNumView.swift
//  Clung

//  Created by Dhruv Gupta on 02/07/22.


import SwiftUI

struct PhoneNumView: View {
    @Binding var currentStep: OnboardingSteps
    @State var userPhone = ""
    
    var body: some View {
        ScrollView{
            Text("Verification")
                .font(Font.custom("Ubuntu-Bold", size: 26))
            Text("Enter your phone number below, We’ll send you a verification code after")
                .multilineTextAlignment(.center)
                .font(Font.custom("Ubuntu-Light", size: 14))
                .lineSpacing(5)
                .padding(.top, 15)
    
            ZStack{
                Rectangle()
                    .foregroundColor(Color("Input Color"))
                HStack{
                    NumInputField(inputText: $userPhone, placeholder: "e.g. +91 96300 53089")
                    Spacer()
                    if userPhone != ""{
                        Button {
                            userPhone = ""
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
                .padding(.vertical, 28)
            Button {
                currentStep = .verification
            } label: {
                Text("Next")
            }
                .buttonStyle(OnboardingCustomButton())

        }
            .padding(.horizontal, 20)
            .padding(.top , 108)
    }
}

struct NumInputField: UIViewRepresentable{
    @Binding var inputText: String
    let placeholder: String
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.font = UIFont(name: "Ubuntu-Medium", size: 14.0)
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        if !context.coordinator.isFirstResponder{
            uiView.becomeFirstResponder()
            context.coordinator.isFirstResponder = true
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $inputText)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate{
        @Binding var inputCode: String
        var isFirstResponder = false
    
        init(text: Binding<String>) {
            self._inputCode = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            inputCode = textField.text ?? ""
        }
    }
}

struct PhoneNumView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumView(currentStep: .constant(.phoneNumInput))
    }
}
