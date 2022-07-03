//  VerificationView.swift
//  Clung

//  Created by Dhruv Gupta on 02/07/22.


import SwiftUI
import UIKit

struct VerificationView: View {
    @Binding var currentStep: OnboardingSteps
    @State var verifCode = ""
    
    var body: some View {
        ScrollView{
            Text("Verification")
                .font(Font.custom("Ubuntu-Bold", size: 26))
            Text("Now, enter the six-digit verification code, we sent to your device")
                .multilineTextAlignment(.center)
                .font(Font.custom("Ubuntu-Light", size: 14))
                .lineSpacing(5)
                .padding(.top, 15)
    
            ZStack{
                Rectangle()
                    .foregroundColor(Color("Input Color"))
                    verifCodeInputField(inputText: $verifCode, placeholder: "--   --   --   --   --   --")
                .padding()
            }
            .frame(width: 150, height: 47, alignment: .center)
                .cornerRadius(20)
                .padding(.vertical, 28)
            
            Spacer()
            Button {
                currentStep = .profileSetup
            } label: {
                Text("Next")
            }
                .buttonStyle(OnboardingCustomButton())
        }
        .padding(.top , 108)
        .padding(.horizontal)
    }
}

struct verifCodeInputField: UIViewRepresentable{
    @Binding var inputText: String
    let placeholder: String
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.textAlignment = .center
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

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView(currentStep: .constant(.verification))
    }
}
