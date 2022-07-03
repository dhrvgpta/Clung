//  ClungApp.swift
//  Clung

//  Created by Dhruv Gupta on 28/06/22.

import SwiftUI
import Firebase

@main
struct ClungApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(AuthVM())
        }
    }
}
