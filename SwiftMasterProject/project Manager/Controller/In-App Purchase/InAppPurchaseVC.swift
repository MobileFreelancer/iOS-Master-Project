//
//  InAppPurchaseVC.swift
//  SwiftMasterProject
//
//  Created by Potenza on 14/02/24.
//

import UIKit
import StoreKit

class InAppPurchaseVC: UIViewController {
    
    var productToPurchase = SKProduct()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PKIAPHandler.shared.fetchAvailableProducts { [weak self](products)   in
            if let product = products.first {
                self?.productToPurchase = product
            }
        }
    }
    
    @IBAction func btnSubscribeClick(_ sender: Any) {
        if PKIAPHandler.shared.canMakePurchases() {
            PKIAPHandler.shared.purchase(product: productToPurchase) { alert, product, transaction in
                print("transaction---->\(String(describing: transaction))")
            }
        }
    }
}
