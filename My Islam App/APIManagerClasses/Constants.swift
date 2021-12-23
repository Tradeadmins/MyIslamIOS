//
//  Constants.swift
//  MoreYeahs
//
//  Created by Mac on 02/02/19.
//  Copyright © 2019 MoreYeahs. All rights reserved.
//

import Foundation
import UIKit
let userDef = UserDefaults.standard

struct Constant {
  
    struct UserSignUpType {
        static let faceBook = "facebook"
        static let google = "google"
        static let noramal = "native"
    }
    
    struct Server {
        static let baseURL = "http://103.73.190.66:8080"
    }
    static let postExternamlLogin : String = "\(Server.baseURL)/api/account/ExternalLogin"
    static let postSignUpUserDetails : String = "\(Server.baseURL)/api/account/Register"
    static let postNativeLoginUserDetails: String = "\(Server.baseURL)/token"
    static let PostSocialloginUserDetails : String = "\(Server.baseURL)/api/account/ExternalLogin"
    static let QuranDescriptionInEnglish : String = "\(Server.baseURL)/Quran/1.json"
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let appManager = AppSettingManager.shared

    }


enum Storyboards: String {
    case main = "Main"
    case dashboard = "Dashboard"
}

enum ViewControllers:String
{
    case login = "LoginViewController"
    case addLanding = "AppLandingScreen"
    case dashBoard = "DashBoardViewController"
}

enum NetworkMessages: String {
    case INTERNET_CONNECTION = "Please check your internet connection"
    case TRY_AGAIN = "Please try again"
    case DATA_OFF = "Mobile Data is Turned Off"
}

struct AlertMessages {
    static let alertTitle = "Alert"
    static let loginSuccussfully = "You have login successfully"
    static let kAlert = "Alert"
    static let kSignUp = "Your account has been created successfully. Verification link is sent to your email address."
    static let kAccActive = "Your account has been created successfully. Verification link is sent to your email address."
    static let kServerError = "Internal Server Error"
    static let kServerErrorMsg = "The server encountered an unexpected condition which prevented it from fulfilling the request."
    static let noInternet = "You seem to be offline, please connect to the internet."
    static let Logout = "Are you sure, you want to Logout?"
    static let DeleteAccount = "Are you sure, you want to delete your Account?"
    static let searchDown = "Oops! search is down momentarily. Please try again later."
}
