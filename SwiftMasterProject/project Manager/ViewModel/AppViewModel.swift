//
//  AppViewModel.swift
//  SwiftMasterProject
//
//  Created by Apple on 28/12/23.
//

import Foundation
import UIKit

public class AppVM  {
    
     //MARK: DECLARATIONS
    var bindViewModelToController : (() -> ()) = {}
    
    private(set) var LoginData : LoginModel! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    private(set) var ForgotData : ForgotPasswordModel! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
     private(set) var RegisterData : LoginModel! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    private(set) var basicresponsemodel : BasicResponse! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    //MARK: INIT METHODS
    init(methodname:APIName,params:[String:Any], image: UIImage = UIImage(), rawData: Data  = Data()) {
        
        switch methodname {
        case APIName.login:
            api_Login(params: params)
            break
            
        case APIName.forgotPassword:
            api_Forgotpasword(params: params)
            break
            
        case APIName.register:
            api_Register(params: params)
            break
          }
     }
    
    //MARK: - Api Register
    func api_Register(params:[String:Any]) {
        APIHelper.sharedInstance.request(modelType: LoginModel.self, apiurl: UrlConstant.apiurl(.register), param: params, completion: { responseObj in
            
            switch responseObj {
            case .success(let data):
                self.LoginData = data
            case .failure(let error):
                switch error {
                case .network(let networkError):
                    if let networkError = networkError {
                        print("Network error --> \(networkError)")
                    } else {
                        print("Network error --> \(String(describing: networkError))")
                    }
                case .invalidResponse, .invalidURL, .invalidData, .decoding: break
                    // Handle other types of errors
                }
            }
        })
    }
    
    //MARK: - Api Login
    func api_Login(params:[String:Any]) {
        APIHelper.sharedInstance.request(modelType: LoginModel.self, apiurl: UrlConstant.apiurl(.login), param: params, completion: { responseObj in
            
            switch responseObj {
            case .success(let data):
                self.LoginData = data
            case .failure(let error):
                switch error {
                case .network(let networkError):
                    if let networkError = networkError {
                        print("Network error --> \(networkError)")
                    } else {
                        print("Network error --> \(String(describing: networkError))")
                    }
                case .invalidResponse, .invalidURL, .invalidData, .decoding: break
                    // Handle other types of errors
                }
            }
        })
    }
    
    //MARK: - Api Forgotpasword
    func api_Forgotpasword(params:[String:Any]) {
        APIHelper.sharedInstance.request(modelType: ForgotPasswordModel.self, apiurl: UrlConstant.forgotpassword, param: params, completion: { responseObj in
            
            switch responseObj {
            case .success(let data):
                self.ForgotData = data
            case .failure(let error):
                switch error {
                case .network(let networkError):
                    if let networkError = networkError {
                        print("Network error --> \(networkError)")
                    } else {
                        print("Network error --> \(String(describing: networkError))")
                    }
                case .invalidResponse, .invalidURL, .invalidData, .decoding: break
                    // Handle other types of errors
                }
            }
        })
    }   
}
