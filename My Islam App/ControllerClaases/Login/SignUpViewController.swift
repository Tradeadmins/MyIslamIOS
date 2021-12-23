//
//  SignUpViewController.swift
//  My Islam App
//
//  Created by Apple on 11/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON
class SignUpViewController: BaseViewController, UITextFieldDelegate {
    // MARK: - property declaration
    
    // MARK: - IBOutlet
    @IBOutlet var privacyPolicyNoticeView: UIView!
    @IBOutlet weak var lblFirstName: UITextField!
    @IBOutlet weak var lblLastName: UITextField!
    @IBOutlet weak var lblEmailId: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    @IBOutlet weak var lblConfirmPassword: UITextField!
    @IBOutlet weak var lblPhoneNumber: UITextField!
    
    // MARK: - View Controller lyfe cyle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        lblFirstName.attributedPlaceholder =
            NSAttributedString(string: "First Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        lblLastName.attributedPlaceholder =
            NSAttributedString(string: "Last Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        lblEmailId.attributedPlaceholder =
            NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        lblPhoneNumber.attributedPlaceholder =
            NSAttributedString(string: "Phone Number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        lblPassword.attributedPlaceholder =
            NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        lblConfirmPassword.attributedPlaceholder =
            NSAttributedString(string: "Confirm Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        self.hideKeyboardWhenTappedAround()
    }
   
    override func setupScreenLayout() {
    }
    
    
     // MARK: - IBActions
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signIn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextBtn(_ sender: Any) {
        
        if (lblFirstName.text?.isEmpty)! {
           ApiResponse.alert(title: AlertMessages.alertTitle, message: "Please enter your first name")
            
        }else if (lblLastName.text?.isEmpty)! {
           ApiResponse.alert(title: AlertMessages.alertTitle, message: "Please enter your last name.")
            
            }
        else if (lblEmailId.text?.isEmpty)!{
             ApiResponse.alert(title: AlertMessages.alertTitle, message: "Please enter your email id.")

        } else if !(lblEmailId.text?.isValidEmail())!{
            ApiResponse.alert(title: AlertMessages.alertTitle, message: "Please enter your vailid email id.")
            
        }else if (lblPassword.text?.isEmpty)!{
            ApiResponse.alert(title: AlertMessages.alertTitle, message: "Please enter your password.")
        }else if lblConfirmPassword.text != lblPassword.text {
          ApiResponse.alert(title: AlertMessages.alertTitle, message: "Confirmed password not matched please try again")
            }
        else {

            Constant.appManager.loggedInUser.firstName = self.lblFirstName.text!
            Constant.appManager.loggedInUser.lastName = self.lblLastName.text!
            Constant.appManager.loggedInUser.email = self.lblEmailId.text!
            Constant.appManager.loggedInUser.phoneNumber = self.lblPhoneNumber.text!
            Constant.appManager.loggedInUser.ConfirmPassword = self.lblConfirmPassword.text!
            Constant.appManager.loggedInUser.password = self.lblPassword.text!
            Constant.appManager.loggedInUser.usereType = Constant.UserSignUpType.noramal
            
            let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "SubscriptionViewController") as! SubscriptionViewController
            self.navigationController?.pushViewController(register, animated: true)
            self.privacyPolicyNoticeView.frame = self.view.bounds
            self.view.addSubview(self.privacyPolicyNoticeView)
        }
     }
 

}
