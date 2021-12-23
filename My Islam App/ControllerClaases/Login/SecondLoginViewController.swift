//
//  SecondLoginViewController.swift
//  My Islam App
//
//  Created by Apple on 13/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Google
import GoogleSignIn
class SecondLoginViewController: BaseViewController,LoginViewModelDeleagte {

    // MARK: - property declaration
    @IBOutlet var objLoginViewModel: LoginViewModel!

    
    // MARK: - View Controller lyfe cyle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

    }
    override func setupScreenLayout()
    {
        objLoginViewModel.viewSecondLogin = self
        objLoginViewModel.delegate = self
        hideKeyboardWhenTappedAround()
    }


    override func setupScreenLayout()
    {
        objLoginViewModel.viewSecondLogin = self
        objLoginViewModel.delegate = self
        hideKeyboardWhenTappedAround()
    }
    // MARK: - IBOutlet
    @IBAction func loginWithGmail(_ sender: Any) {
         self.objLoginViewModel.loginWithGoogle(loginVC: "")
    }
    
    @IBAction func loginWithFaceBook(_ sender: Any) {
       self.objLoginViewModel.loggedInWithfacebook()
    }

    @IBAction func signupWithLoginBtn(_ sender: Any) {
    let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
    self.navigationController?.pushViewController(register, animated: true)
    }
    
    @IBAction func signInBtn(_ sender: Any) {
    let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
    self.navigationController?.pushViewController(register, animated: true)
    }
    
    func socialLoggedInResult(success: Bool, userDetail: UserDetailModel) {
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
    
    func socialLoggedInResult(success: Bool, userDetail: UserDetailModel) {
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
extension SecondLoginViewController:GIDSignInUIDelegate{
    
}
extension SecondLoginViewController:GIDSignInUIDelegate{
    
}
