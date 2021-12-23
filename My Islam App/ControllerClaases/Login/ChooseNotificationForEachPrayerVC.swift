//
//  ChooseNotificationForEachPrayerVC.swift
//  My Islam App
//
//  Created by Apple on 24/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Foundation
class ChooseNotificationForEachPrayerVC: BaseViewController,LoginViewModelDeleagte {
    
    // MARK: - property declaration
    
    
     // MARK: - IBOutlet
    
    @IBOutlet weak var fatjPrayerNotification: UILabel!
   @IBOutlet weak var DhudrPrayerNotification1: UILabel!
    @IBOutlet weak var  asharPrayerNotification1: UILabel!
    @IBOutlet var objectUserModel: LoginViewModel!
    @IBOutlet weak var lblSelectedQuranLaguage: UILabel!
    @IBOutlet weak var farjNotification: UISwitch!
    @IBOutlet weak var farjView: UIView!

    // MARK: - View Controller lyfe cyle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

    }
    
    override func setupScreenLayout()
    {
        objectUserModel.notificationViewController = self
        objectUserModel.delegate = self
        hideKeyboardWhenTappedAround()
        
        
    }
    
    @IBAction func swiftFjarAction(_ sender: UISwitch) {
        if sender.isOn == true {
           Constant.appManager.loggedInUser.isfjar = true
        }else{
            Constant.appManager.loggedInUser.isfjar = false
        }
        
    }
    
    @IBAction func swiftDhurAction(_ sender: UISwitch) {
        if sender.isOn == true {
            Constant.appManager.loggedInUser.isDhur = true
        }else{
            Constant.appManager.loggedInUser.isDhur = false
        }
        
    }
    
    @IBAction func swiftAsarAction(_ sender: UISwitch) {
        if sender.isOn == true {
          Constant.appManager.loggedInUser.isAsar  = true
        }else{
          Constant.appManager.loggedInUser.isAsar  = false
        }
        
    }
    

    @IBAction func swiftFjarAction(_ sender: UISwitch) {
        if sender.isOn == true {
           Constant.appManager.loggedInUser.isfjar = true
        }else{
            Constant.appManager.loggedInUser.isfjar = false
        }
        
    }
    
    @IBAction func swiftDhurAction(_ sender: UISwitch) {
        if sender.isOn == true {
            Constant.appManager.loggedInUser.isDhur = true
        }else{
            Constant.appManager.loggedInUser.isDhur = false
        }
        
    }
    
    @IBAction func swiftAsarAction(_ sender: UISwitch) {
        if sender.isOn == true {
          Constant.appManager.loggedInUser.isAsar  = true
        }else{
          Constant.appManager.loggedInUser.isAsar  = false
        }
        
    }
    
    @IBAction func swiftMagribAction(_ sender: UISwitch) {
        if sender.isOn == true {
            Constant.appManager.loggedInUser.isMagrib  = true
        }else{
            Constant.appManager.loggedInUser.isMagrib  = false
        }
        
    }
    
    @IBAction func swiftIshaAction(_ sender: UISwitch) {
        if sender.isOn == true {
            Constant.appManager.loggedInUser.isIsha  = true
        }else{
            Constant.appManager.loggedInUser.isIsha  = false
        }
        
    }
    
    // MARK: - IBActions
    @IBAction func selectQuranLanguage(_ sender: Any) {
   
    }
 
    @IBAction func nextBtn(_ sender: Any) {
        
        if Constant.appManager.loggedInUser.usereType == Constant.UserSignUpType.faceBook {
            self.objectUserModel.facebookApiPost(userName: Constant.appManager.loggedInUser.fbUserId!, firstName: Constant.appManager.loggedInUser.firstName!, lastName: Constant.appManager.loggedInUser.lastName!, email: Constant.appManager.loggedInUser.email!, phoneNumber: "", fajrNotification: true, dhudrNotification: true, asarNotification: true, magribNotification: true, ishaNotification: true, fajrAlarm:  Constant.appManager.loggedInUser.isfjar!, dhudrAlarm:  Constant.appManager.loggedInUser.isDhur!, asarAlarm:  Constant.appManager.loggedInUser.isAsar!, magribAlarm:  Constant.appManager.loggedInUser.isMagrib!, ishaAlarm:  Constant.appManager.loggedInUser.isIsha!, languageCode: "1", subscriptionType:  Constant.appManager.loggedInUser.freeTrail!, provider: Constant.UserSignUpType.faceBook, externalUserId: Constant.appManager.loggedInUser.fbUserId!)
            
        }else if Constant.appManager.loggedInUser.usereType == Constant.UserSignUpType.google {
            
            self.objectUserModel.googleApiPost(userName: Constant.appManager.loggedInUser.clientID!, firstName: Constant.appManager.loggedInUser.fullName!, lastName: Constant.appManager.loggedInUser.fullName!, email: Constant.appManager.loggedInUser.email!, phoneNumber: "", fajrNotification: true, dhudrNotification: true, asarNotification: true, magribNotification: true, ishaNotification: true, fajrAlarm:  Constant.appManager.loggedInUser.isfjar!, dhudrAlarm:  Constant.appManager.loggedInUser.isDhur!, asarAlarm:  Constant.appManager.loggedInUser.isAsar!, magribAlarm:  Constant.appManager.loggedInUser.isMagrib!, ishaAlarm:  Constant.appManager.loggedInUser.isIsha!, languageCode: "1", subscriptionType:  Constant.appManager.loggedInUser.freeTrail!, provider: Constant.UserSignUpType.google, externalUserId: Constant.appManager.loggedInUser.clientID!)
        }else {
             self.objectUserModel.signUpUserDetailsPost(firstName: Constant.appManager.loggedInUser.firstName ?? "",lastName: Constant.appManager.loggedInUser.lastName ?? "", userName:  Constant.appManager.loggedInUser.email ?? "", email: Constant.appManager.loggedInUser.email ?? "", phoneNumber: Constant.appManager.loggedInUser.phoneNumber ?? "",password: Constant.appManager.loggedInUser.password ?? "", fajrNotification: true, dhudrNotification: true, asarNotification: true, magribNotification: true, ishaNotification: true, fajrAlarm: Constant.appManager.loggedInUser.isfjar!, dhudrAlarm: Constant.appManager.loggedInUser.isDhur!, asarAlarm: Constant.appManager.loggedInUser.isAsar!, magribAlarm: Constant.appManager.loggedInUser.isMagrib!, ishaAlarm: Constant.appManager.loggedInUser.isIsha!, languageCode: 1 ,subscriptionType: Constant.appManager.loggedInUser.freeTrail!)
        }
        
       
   }
    func socialLoggedInResult(success: Bool, userDetail: UserDetailModel) {
       
        if success {
            DispatchQueue.main.async {
                let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "QuranVC") as! QuranVC
                self.navigationController?.pushViewController(register, animated: true)
            }
        }else{
            
        }
    }
    
    
    
}



    // MARK: - localization()
    func localization(){
        fatjPrayerNotification.text = "Farj".localized
        DhudrPrayerNotification1.text = "Dhudr".localized
        asharPrayerNotification1.text = "Asar".localized
        ishaPrayerNotification.text = "Isha".localized
        magribPrayerNotification.text = "Magrib".localized
        lblQuranLanguage.text = "Magrib".localized
        settingMenuText.text = "You can also change the notification in the Setting Menu".localized
        lblHeader.text = "14 Jumada 1440 | Fajr: 05:58".localized
        chooseNotification.text = "Choose Notification".localized
     }
  }

    func socialLoggedInResult(success: Bool, userDetail: UserDetailModel) {
       
        if success {
            DispatchQueue.main.async {
                let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "QuranVC") as! QuranVC
                self.navigationController?.pushViewController(register, animated: true)
            }
        }else{
            
        }
    }
    
    
    
}




