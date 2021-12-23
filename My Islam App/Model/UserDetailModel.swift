//
//  UserDetailModel.swift
//  My Islam App
//
//  Created by Mac on 02/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SwiftyJSON
class UserDetailModel: NSObject {
    var fbUserId:String?
    var socialLoginId:Int?
    var firstName:String?
    var lastName:String?
    var fullName:String?
    var email:String?
    var phoneNumber:String?
    var image:String?
    var birthday:String?
    var password:String?
    var ConfirmPassword:String?
     //Google user details
    var serverClientID:String?
    var clientID:String?
    var accessToken:String?
    
    //Notification user details
    var selectedQuranLanguage:String?
    //Subscription Tybe
    var freeTrail:String? = "Trail"
    var monthlySubscription:String?
    var yearlySubscription:String?
    
    //NativeLogin respose
    var refresh_token:String?
    var issued:String?
    var token_type:String?
    var client_id:String?
    var expires_in:String?
    var expires:String?

    //signUp user respose
    var signupStatusCode:Int?
    var content:String?
    var signupResult:Int?
    var errorMessage:String?
    var timestamp:String?
    var usereType:String? = ""
    //Alarm
    var isfjar:Bool? = false
    var isDhur:Bool? = false
    var isAsar:Bool? = false
    var isMagrib:Bool? = false
    var isIsha:Bool? = false
    
    var isAlreadySignedUp:Bool = false


    
    override init() {
        super.init()
    }
    
    static var objUserDetailModel = UserDetailModel()

    func updateSocialData(data:[String:Any]) {
        self.firstName =  data["first_name"] as? String
        self.lastName  =  data["last_name"]  as? String
        self.email = data["email"] as? String
        self.fbUserId = data["id"] as? String
        
    }
    
    func nativeLogin(respose:[String:Any]) {
        self.refresh_token =  respose["refresh_token"] as? String
        self.issued  =  respose[".issued"]  as? String
        self.token_type    =  respose["token_type"] as? String
        self.client_id =  respose["client_id"] as? String
        self.expires_in  = respose["expires_in"] as? String
        self.expires  = respose[".expires"] as? String

    }
    func GetstrExpires_in() -> String {
          return self.expires_in!
    }
    
    
    func signUpRespose(respose:[String:Any]) {
        self.signupStatusCode =  respose["statusCode"] as? Int
        self.content  =  respose["content"]  as? String
        self.signupResult    =  respose["result"] as? Int
        self.errorMessage =  respose["errorMessage"] as? String
        self.timestamp  = respose["timestamp"] as? String
    }
    
}
