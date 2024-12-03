//
//  NotificationsVC.swift
//  SwiftMasterProject
//
//  Created by Apple on 02/01/24.
//

import UIKit
import OneSignalFramework

class NotificationsVC: UIViewController {
    
    /*
     =======================================================================
     ImportantNotes For PushNotifications
     1.The first step will be to create or open your Xcode project and add push notifications permissions to your app target
     2.Make sure first of all setup app in firebaseAccount and setup in cloud messaging
     3.If you do not see Push Notifications enabled, click + Capability and add Push Notifications.
     =======================================================================
     */
    
    
    /*
     =======================================================================
     ImportantNotes For OneSignal
     1.If you do not see Push Notifications enabled, click + Capability and add Push Notifications.
     2.In Xcode Select File > New > Target...  Select Notification Service Extension then Next.
     3.Do not activate the scheme on the dialog that is shown after selecting "Finish"..... Press Cancel on the Activate scheme prompt.
     4.Select your Main App Target > Signing & Capabilities > + Capability > App Groups.
     =======================================================================
     */
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IB_Actions
    @IBAction func btnPushNotificationClick(_ sender: UIButton) {
        registerNotification(aViewcontoller: self)
    }
    
    @IBAction func btnOneSignalClick(_ sender: UIButton) {
        Utils.showOkAlert(vc: self, title: "", message: "Please set up OneSignal")
        //        registerOneSignal() //Notes:- After done setup for onesigmal then after uncommenting code
    }
}

//MARK: - Notification Delegate
extension NotificationsVC: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        print("Will present notification: \(userInfo)")
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        print("Did receive notification response: \(userInfo)")
        
        completionHandler()
        print("userinfo total count==>\(userInfo.count)")
    }
}
