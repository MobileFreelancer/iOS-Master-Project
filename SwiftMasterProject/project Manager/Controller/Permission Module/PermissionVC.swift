//
//  LoginVC.swift
//  SwiftMasterProject
//
//  Created by Apple on 27/12/23.
//

import UIKit
import CoreLocation

class PermissionVC: UIViewController {
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setUpUI()
    }
    
    //MARK: - SetUpUI

    //MARK: - IB_Actions
    @IBAction func btnCameraClick(_ sender: Any) {
        Permissions().showAlert(aViewcontoller: self, title: "complete action using")
    }
    
    @IBAction func btnLocationClick(_ sender: Any) {
        Permissions().checkLocationPermission(aViewcontoller: self)
    }
    
     @IBAction func btnFileManagerClick(_ sender: Any) {
         Permissions().openDocumentPicker(aViewcontoller: self)
     }
}

//MARK: - ImagePicker Delegate
extension PermissionVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        let image1 =  info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        print("Selected Image==>\(image1 ?? UIImage())")
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - Location Manager Delegate
extension PermissionVC: CLLocationManagerDelegate {
 
    func didUpdateLocation(_ location: CLLocation) {
        print("User's current location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
    }
}

//MARK: - DocumentPicker Delegate
extension PermissionVC: UIDocumentPickerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let selectedURL = urls.first else {
            return
        }
        print("Selected document URL: \(selectedURL)")
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("Document picker was cancelled")
    }
}
