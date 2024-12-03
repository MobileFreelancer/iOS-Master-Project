//
//  HomeVC.swift
//  SwiftMasterProject
//
//  Created by Apple on 01/01/24.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Ib_Actions
    @IBAction func btnPermissions(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "PermissionVC") as! PermissionVC
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func btnAuthentications(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Authentications", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "AuthenticationsVC") as! AuthenticationsVC
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func btnPreference(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Preference", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "PreferenceVC") as! PreferenceVC
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func btnNotifications(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Notifications", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "NotificationsVC") as! NotificationsVC
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func btnRatingsReviewClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CommanAndComplexUI", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "RatingReviewVC") as! RatingReviewVC
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func btnBluettothClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CommanAndComplexUI", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "BluetoothVC") as! BluetoothVC
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func btnMapClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CommanAndComplexUI", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "MapRouteVC") as! MapRouteVC
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func btnInAppClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CommanAndComplexUI", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "InAppPurchaseVC") as! InAppPurchaseVC
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
