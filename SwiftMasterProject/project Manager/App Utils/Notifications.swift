//
//  Notifications.swift
//  SwiftMasterProject
//
//  Created by Apple on 02/01/24.
//

import Foundation
import UIKit
import UserNotifications
import FirebaseCore
import FirebaseMessaging
import OneSignalFramework

//MARK: -  Other Functions


//MARK: - Notiifcation SetUp
func registerNotification(aViewcontoller : UIViewController) {
    let center = UNUserNotificationCenter.current()
    center.delegate = aViewcontoller as? UNUserNotificationCenterDelegate
    center.requestAuthorization(options: [.sound, .alert, .badge]) { granted, error in
        if error == nil {
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
}

//MARK: - OneSignal SetUp
func registerOneSignal() {
     let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let launchOptions = appDelegate.launchOptions
    
    OneSignal.Debug.setLogLevel(.LL_VERBOSE)
    OneSignal.initialize("YOUR_ONESIGNAL_APP_ID", withLaunchOptions: launchOptions)
}
