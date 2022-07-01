//  AuthVM.swift
//  Clung

//  Created by Dhruv Gupta on 01/07/22.

import Foundation
import FirebaseAuth

struct AuthVM{
    static func isUserLoggedIn() -> Bool {
        
        // Don't have to specify "return" when the func is just one-liner
        Auth.auth().currentUser != nil ? true : false
    }
    
    static func fetchCurrentUserID() -> String {
        
        // Check for if there is any user logged in
        if isUserLoggedIn(){
           return Auth.auth().currentUser!.uid
        }
        
        // If not, then display the message below
        else {
            let msg = "Can't fetch the UID: No logged-in user found"
            print(msg)
            return msg
        }
    }
    
    static func logOut(){
        
        do{
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}

