//
//  PreferenceVC.swift
//  SwiftMasterProject
//
//  Created by Apple on 02/01/24.
//

import UIKit

class PreferenceVC: UIViewController {
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        savePreference()
    }
    
    
    //MARK: - GetPreference
    func savePreference() {
        UserDefaultConstant().saveValueUD(key: UserDefaultKeys.kEmail, valueToSave: "dummytest@yopmail.com")
        UserDefaultConstant().saveValueUD(key: UserDefaultKeys.kUserName, valueToSave: "dummytest")
        UserDefaultConstant().saveValueUD(key: UserDefaultKeys.kId, valueToSave: "12")
    }
    
    //MARK: - SavePreference
    func getPrefrence() {
           let email = UserDefaultConstant().getValueFromUD(using: UserDefaultKeys.kEmail)
           let userName = UserDefaultConstant().getValueFromUD(using: UserDefaultKeys.kUserName)
           let id = UserDefaultConstant().getValueFromUD(using: UserDefaultKeys.kId)
        Utils.showOkAlert(vc: self, title: "", message: "Emai:-\(email)----UserName:-\(userName)----Id:-\(id)")
           print("Emai:-\(email)----UserName:-\(userName)----Id:-\(id)")
    }
    
    //MARK: - IB_Actions
    @IBAction func btnGetPreference(_ sender: UIButton) {
        self.getPrefrence()
    }
    
    
    @IBAction func btnApiModule(_ sender: UIButton) {
        
    }
}
