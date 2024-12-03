//
//  AuthenticationsVC.swift
//  SwiftMasterProject
//
//  Created by Apple on 28/12/23.
//

import UIKit
import GoogleSignIn
import FacebookCore
import FacebookLogin
import AuthenticationServices

class AuthenticationsVC: UIViewController {
    
    //MARK: - Declrations
    var objVM : AppVM?
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Api Calling
    //Login Api
    func apiLogin() {
        
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
    
    //Login Api
    func apiForgotpassword() {
        
        var params = [String:Any]()
        params[APIParamKeys.kEmailAddress] = "johnwick@example.com"
        params[APIParamKeys.kPassword] = "0lelplR"
        
        self.objVM = AppVM(methodname: .forgotPassword, params: params)
        self.objVM?.bindViewModelToController = {
            if self.objVM?.ForgotData != nil {
                Utils.showOkAlert(vc: self, title: "", message: "Register Successfully")
            }
            else {
                Utils.showOkAlert(vc: self, title: "", message: "Failed Register")
            }
        }
    }
  
    
    //SignUp
    func apiSignUp() {
        var params = [String:Any]()
        params[APIParamKeys.kEmailAddress] = "johnwick@example.com"
        self.objVM = AppVM(methodname: .forgotPassword, params: params)
        self.objVM?.bindViewModelToController = {
            
            if self.objVM?.LoginData != nil {
                Utils.showOkAlert(vc: self, title: "", message: "Login Successfully")
                
            }
            else {
                Utils.showOkAlert(vc: self, title: "", message: "Failed Login")
            }
        }
    }
    
    //GoogleLogin
    func setupGoogleLogin(){
        //Note: - First of all can you please setup for firebase googlesign and added Googleservice File
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { user, error in
            guard error == nil else { return }
            guard let user = user?.user else {
                print("User information not available.")
                return
            }
            //Api calling
        }
    }
    
    //FacebookLogin
    func setupFacebookLogin() {
        //Note: - First of all can you please setup for firebase googlesign and added Googleservice File
        
        let loginManager = LoginManager()
        loginManager.logOut()
        loginManager.logIn(permissions: ["public_profile", "email"], from: self, handler: { result, error in
            if error != nil {
                print("ERROR: Trying to get login results")
            } else if result?.isCancelled != nil {
                print("The token is \(result?.token?.tokenString ?? "")")
                if result?.token?.tokenString != nil {
                    print("Logged in")
                    let graphRequest: GraphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "id, first_name, middle_name, last_name, name, picture, email, gender, birthday"])
                    graphRequest.start {  _, result, error in
                        if error == nil {
                            let data: [String: AnyObject] = result as! [String: AnyObject]
                            print("Facebook user data - ",data)
                            
                            //Api calling
                        }
                    }
                } else {
                    print("Cancelled")
                }
            }
        })
    }
    
    //AppleLogin
    func setupAppleLogin(){
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    //MARK: - IB_Actions
    @IBAction func btnLoginClick(_ sender: UIButton) {
        self.apiLogin()
    }
    
    @IBAction func btnSignUpClick(_ sender: UIButton) {
        self.apiSignUp()
    }
    
    @IBAction func btnForgotPasswordClick(_ sender: UIButton) {
        self.apiForgotpassword()
    }
    
    @IBAction func btnGoogleClick(_ sender: UIButton) {
//        Utils.showOkAlert(vc: self, title: "", message: "Please set up google sign in")
        //Google signin code done then uncommnet setupGoogleLogin function
                setupGoogleLogin()  //Google Signin Done then after uncommenting line
    }
    
    @IBAction func btnFacebookClick(_ sender: UIButton) {
        Utils.showOkAlert(vc: self, title: "", message: "Please set up facebook sign in")
        //Facebook signin code done then uncommnet setupGoogleLogin function
        //        setupFacebookLogin()  //Facebook Signin Done then after uncommenting line
        
    }
    
    @IBAction func btnAppleClick(_ sender: UIButton) {
        Utils.showOkAlert(vc: self, title: "", message: "Please login in real device")
                setupAppleLogin() //use in real device then after uncommenting line
        
    }
}

//MARK: - AppleLogin Delegate methods
extension AuthenticationsVC: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            print("userIdentifier==>\(userIdentifier)")
            
            //Api calling
        }
    }
}
