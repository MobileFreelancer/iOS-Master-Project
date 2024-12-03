//
//  ApiCallVC.swift
//  SwiftMasterProject
//
//  Created by Apple on 03/01/24.
//

import UIKit
import Alamofire

class ApiCallVC: UIViewController {
    
    //MARK: - Declrations
    var objVM : AppVM?
    
    /*
     =======================================================================
                                ImportantNotes
     
     =======================================================================
     */
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    //MARK: - Api calling
    func ApiDummy() {
        
        var params = [String:Any]()
        params[APIParamKeys.kUserName] = "kminchelle"
        params[APIParamKeys.kPassword] = "0lelplR"
        
        self.objVM = AppVM(methodname: .login, params: params)
        self.objVM?.bindViewModelToController = {
            if self.objVM?.LoginData != nil {
                Utils.showOkAlert(vc: self, title: "", message: "Login Successfully")
            }
            else {
                Utils.showOkAlert(vc: self, title: "", message: "Failed Login")
            }
        }
    }
    
    //MARK: - Ib_Actions
     @IBAction func btnApiCall(_ sender: UIButton) {
        ApiDummy()
    }
}
