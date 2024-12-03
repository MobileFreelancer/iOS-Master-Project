//
//  RatingReviewVC.swift
//  SwiftMasterProject
//
//  Created by Potenza on 09/02/24.
//

import UIKit
import Cosmos

class RatingReviewVC: UIViewController {

    //MARK: IB_OUTLETS
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var txtReview: UITextView!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var parentView: UIView!
    
    //MARK: DECLARATIONS
    
    //MARK: VIEW_METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    //MARK: OTHER_METHODS
    func setUpView() {
        setUpUI()
    }
    
    func setUpUI() {
        [parentView,txtReview,btnSubmit].forEach({$0?.makeBorder()})
        txtReview.text = "Enter your review.."
    }
}
