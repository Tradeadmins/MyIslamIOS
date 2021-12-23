//
//  LoginVC.swift
//  My Islam App
//
//  Created by Apple on 21/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Foundation
import Google
import GoogleSignIn

class LoginVC: BaseViewController {
    
    // MARK: - property declaration
    
    // MARK: - IBOutlet
    @IBOutlet weak var lblEmailId: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    @IBOutlet var loginViewModel: LoginViewModel!

    // MARK: - View Controller lyfe cyle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

    lblEmailId.attributedPlaceholder =
        NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    lblPassword.attributedPlaceholder =
        NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    override func setupScreenLayout()
    {
        loginViewModel.viewController = self
        loginViewModel.delegate = self
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - IBActions
    @IBAction func googleAction(_ sender: Any) {
        self.loginViewModel.loginWithGoogle(loginVC: "login")
    }
    
    @IBAction func facebookAction(_ sender: Any) {
         self.loginViewModel.loggedInWithfacebook()
    }
    
    @IBAction func nativeLoginButton(_ sender: Any) {
        if (lblEmailId.text?.isEmpty)! {
            ApiResponse.alert(title: AlertMessages.alertTitle, message: "Please enter your emailId")
            
        }else if (lblPassword.text?.isEmpty)! {
            ApiResponse.alert(title: AlertMessages.alertTitle, message: "Please enter your password.")
        }else{
           self.loginViewModel.loginUserDetails(emailId:self.lblEmailId.text!, password:self.lblPassword.text!)
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(register, animated: true)
    }
}

extension LoginVC:LoginViewModelDeleagte
{
    func socialLoggedInResult(success: Bool, userDetail: UserDetailModel)
    {
        if success
        { if userDetail.isAlreadySignedUp{
            DispatchQueue.main.async {
                let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "QuranVC") as! QuranVC
                self.navigationController?.pushViewController(register, animated: true)
            }
        }
        else{
            DispatchQueue.main.async {
                let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "SubscriptionViewController") as! SubscriptionViewController
                self.navigationController?.pushViewController(register, animated: true)
            }
            }
        }
    }
}
extension LoginVC:GIDSignInUIDelegate{
    
}
