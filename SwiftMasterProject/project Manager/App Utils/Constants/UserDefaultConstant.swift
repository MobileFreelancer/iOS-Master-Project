//
//  UserDefaultConstant.swift
//  SwiftMasterProject
//
//  Created by Apple on 02/01/24.
//

import Foundation

class UserDefaultConstant {
    
    /*
     ====================================================================
     Function purpose : Save values in userdefaults.
     ====================================================================
     */
    func saveValueUD(key : String, valueToSave : Any) {
        UserDefaults.standard.set(valueToSave, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    
    /*
     ====================================================================
     Function purpose : Remove specific value from userdefaults.
     ====================================================================
     */
    func removeValueFromUD(using key : String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    /*
     ====================================================================
     Function purpose : get specific value from userdefaults.
     ====================================================================
     */
    
    func getValueFromUD(using key : String) -> String {
    
        if let retrievedValue = UserDefaults.standard.object(forKey: key) {
            if let stringValue = retrievedValue as? String {
                // Do something with the string value
                return stringValue
            }
        }
        return ""
    }

    /*
     ====================================================================
     Function purpose : Clear all userdefaults value.
     ====================================================================
     */
    func clearAllUserDefault() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
