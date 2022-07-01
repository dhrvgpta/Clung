//  AppDelegate.swift
//  Clung

//  Created by Dhruv Gupta on 29/06/22.

import UIKit
import FirebaseCore

// Need more steps than just .configure() coz we have to use a feature called Silent APNs Notifications
class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
      [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      FirebaseApp.configure()
    return true
  }
}
