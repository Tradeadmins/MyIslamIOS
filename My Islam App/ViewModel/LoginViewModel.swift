//
//  LoginViewModel.swift
//  My Islam App
//
//  Created by Mac on 02/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit
import Google
import GoogleSignIn
import SwiftyJSON
import Firebase
import FirebaseAuth
protocol LoginViewModelDeleagte
{
    func socialLoggedInResult(success:Bool,userDetail:UserDetailModel)
}

class LoginViewModel: NSObject {
    var delegate:LoginViewModelDeleagte?

    var viewController:LoginVC?
    var viewSecondLogin:SecondLoginViewController?

    var notificationViewController:ChooseNotificationForEachPrayerVC?
    
    // For google Delegate
    func loginWithGoogle(loginVC:String)
    {
          GIDSignIn.sharedInstance()?.signOut()
        GIDSignIn.sharedInstance().clientID = "367001763476-88laffgb0c1qsirliu8sj97pb1inqcqe.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self

        if loginVC == "login" {
            GIDSignIn.sharedInstance().uiDelegate = self.viewController
        }else{
            GIDSignIn.sharedInstance().uiDelegate = self.viewSecondLogin
        }

        GIDSignIn.sharedInstance().signIn()
        
    }
    
   // For Facebook permission
    func loggedInWithfacebook()
    {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()

        fbLoginManager.logIn(withReadPermissions:  ["public_profile", "email"], from: viewController) { (result, error) in

            print(result as Any)
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    print(fbloginresult.token.tokenString)
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        self.getFBUserData(tokenString :fbloginresult.token.tokenString)
                    }
                }
            }
        }
    }
    //Get Facebook user details
    func getFBUserData(tokenString : String?){
        
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, email"]).start(completionHandler: { (connection, result, error) -> Void in
                if let data = result as? [String:Any]{
                    Constant.appManager.loggedInUser.updateSocialData(data: data)
                    Constant.appManager.loggedInUser.usereType = Constant.UserSignUpType.faceBook
                  }
                  if (error == nil){
                  self.facebookExterNalLogin(fbID: Constant.appManager.loggedInUser.fbUserId!)
                    // self.delegate?.socialLoggedInResult(success: true, userDetail:  Constant.appManager.loggedInUser)
                }
                else{
                    self.delegate?.socialLoggedInResult(success: false, userDetail: Constant.appManager.loggedInUser)
                   }
            })
        }
    }
       //Post Check Wxternal login
    func facebookExterNalLogin(fbID: String)
    {
        Constant.appManager.loggedInUser.isAlreadySignedUp = false
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            ]
        
        let postData = NSMutableData(data: "externalUserId=\(fbID)".data(using: String.Encoding.utf8)!)
        let url = Constant.postExternamlLogin
        postData.append("&provider=\(Constant.appManager.loggedInUser.usereType!)".data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            let httpResponse = response as? HTTPURLResponse
            let jsonString = try? JSONSerialization.jsonObject(with: data!, options:  []) as? [String:Any]
            if  httpResponse?.statusCode == 200 {
                if let data = jsonString as? [String:Any]{
                    UserDetailModel.objUserDetailModel.nativeLogin(respose: data)
                    print(data)
                }
                Constant.appManager.loggedInUser.isAlreadySignedUp = true
                self.delegate?.socialLoggedInResult(success: true, userDetail:  Constant.appManager.loggedInUser)
                
            }else {
                self.delegate?.socialLoggedInResult(success: true, userDetail:  Constant.appManager.loggedInUser)
            }
        })
        
        dataTask.resume()
        
    }
    //Post Facebook details on server
    func facebookApiPost(userName: String,firstName:String,lastName:String,email:String,phoneNumber:String,fajrNotification:Bool,dhudrNotification:Bool,asarNotification:Bool,magribNotification:Bool,ishaNotification:Bool,fajrAlarm: Bool,dhudrAlarm:Bool,asarAlarm:Bool,magribAlarm:Bool,ishaAlarm:Bool,languageCode:String,subscriptionType: String,provider:String,externalUserId:String)
        {
      
            let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            ]
        
        let postData = NSMutableData(data: "grant_type=password".data(using: String.Encoding.utf8)!)
        let url = Constant.PostSocialloginUserDetails
        postData.append("&userName=\(userName)".data(using: String.Encoding.utf8)!)
        postData.append("&firstName=\(firstName)".data(using: String.Encoding.utf8)!)
        postData.append("&email=\(email)".data(using: String.Encoding.utf8)!)
        postData.append("&phoneNumber=\(phoneNumber)".data(using: String.Encoding.utf8)!)
        postData.append("&fajrNotification=\(fajrNotification)".data(using: String.Encoding.utf8)!)
        postData.append("&dhudrNotification=\(dhudrNotification)".data(using: String.Encoding.utf8)!)
        postData.append("&asarNotification=\(asarNotification)".data(using: String.Encoding.utf8)!)
        postData.append("&magribNotification=\(magribNotification)".data(using: String.Encoding.utf8)!)
        postData.append("&ishaNotification=\(ishaNotification)".data(using: String.Encoding.utf8)!)
        postData.append("&fajrAlarm=\(fajrAlarm)".data(using: String.Encoding.utf8)!)
        postData.append("&dhudrAlarm=\(dhudrAlarm)".data(using: String.Encoding.utf8)!)
        postData.append("&asarAlarm=\(asarAlarm)".data(using: String.Encoding.utf8)!)
        postData.append("&ishaAlarm=\(ishaAlarm)".data(using: String.Encoding.utf8)!)
        postData.append("&magribAlarm=\(magribAlarm)".data(using: String.Encoding.utf8)!)
        postData.append("&languageCode=\(languageCode)".data(using: String.Encoding.utf8)!)
        postData.append("&subscriptionType=\(subscriptionType)".data(using: String.Encoding.utf8)!)
        postData.append("&provider=\(provider)".data(using: String.Encoding.utf8)!)
        postData.append("&externalUserId=\(externalUserId)".data(using: String.Encoding.utf8)!)
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            let httpResponse = response as? HTTPURLResponse
            let jsonString = try? JSONSerialization.jsonObject(with: data!, options:  []) as? [String:Any]
            if  httpResponse?.statusCode == 200 {
                if let data = jsonString as? [String:Any]{
                    UserDetailModel.objUserDetailModel.nativeLogin(respose: data)
                    print(data)
                }
                self.delegate?.socialLoggedInResult(success: true, userDetail:  Constant.appManager.loggedInUser)

            }else {
                self.delegate?.socialLoggedInResult(success: false, userDetail:  Constant.appManager.loggedInUser)
                if jsonString == nil {
                    ApiResponse.alert(title: AlertMessages.alertTitle, message: "Some thing went wrong", controller: self.viewController)
                }else{
                    ApiResponse.alert(title: AlertMessages.alertTitle, message: (jsonString!?["errorMessage"] as? String)!, controller: self.viewController)
                }
            }
            
        })
        
        dataTask.resume()

    }
 
 func loginUserDetails(emailId: String,password:String){
    
    let headers = [
        "content-type": "application/x-www-form-urlencoded",
        "cache-control": "no-cache",
        ]
    let postData = NSMutableData(data: "&grant_type=password".data(using: String.Encoding.utf8)!)
    postData.append("&password=\(password)".data(using: String.Encoding.utf8)!)
    postData.append("&username=\(emailId)".data(using: String.Encoding.utf8)!)
    postData.append("&client_id=ngAuthApp".data(using: String.Encoding.utf8)!)
    let request = NSMutableURLRequest(url: NSURL(string: "\(Constant.postNativeLoginUserDetails)")! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = postData as Data
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error == nil) {
            let jsonString = try? JSONSerialization.jsonObject(with: data!, options:  []) as? [String:Any]
            let httpResponse = response as? HTTPURLResponse
            if  httpResponse?.statusCode == 200 {
                if let data = jsonString as? [String:Any]{
                    UserDetailModel.objUserDetailModel.nativeLogin(respose: data)
                    print(data)
                }
                 self.delegate?.socialLoggedInResult(success: true, userDetail:  Constant.appManager.loggedInUser)
            }else {
                 self.delegate?.socialLoggedInResult(success: false, userDetail:  Constant.appManager.loggedInUser)
                if jsonString == nil {
                    ApiResponse.alert(title: AlertMessages.alertTitle, message: "Some thing went wrong", controller: self.viewController)
                }else{
                    ApiResponse.alert(title: AlertMessages.alertTitle, message: (jsonString!?["error_description"] as? String)!, controller: self.viewController)
                }
            }
        }
    })
    dataTask.resume()
}
func signUpUserDetailsPost(firstName:String, lastName:String, userName:String, email:String, phoneNumber:String, password:String, fajrNotification:Bool,dhudrNotification:Bool,asarNotification:Bool,magribNotification:Bool,ishaNotification:Bool,fajrAlarm:Bool,dhudrAlarm:Bool,asarAlarm:Bool,magribAlarm:Bool,ishaAlarm:Bool,languageCode:Int,subscriptionType:String){
  
    let headers = [
        "content-type": "application/x-www-form-urlencoded",
        "cache-control": "no-cache",
        ]
    let postData = NSMutableData(data: "&firstName=\(firstName)".data(using: String.Encoding.utf8)!)
    postData.append("&lastName=\(lastName)".data(using: String.Encoding.utf8)!)
    postData.append("&username=\(email)".data(using: String.Encoding.utf8)!)
    postData.append("&email=\(email)".data(using: String.Encoding.utf8)!)
    postData.append("&phoneNumber=\("")".data(using: String.Encoding.utf8)!)
    postData.append("&password=\(password)".data(using: String.Encoding.utf8)!)
    postData.append("&fajrNotification=\(fajrNotification)".data(using: String.Encoding.utf8)!)
    postData.append("&dhudrNotification=\(dhudrNotification)".data(using: String.Encoding.utf8)!)
    postData.append("&asarNotification=\(asarNotification)".data(using: String.Encoding.utf8)!)
    postData.append("&magribNotification=\(magribNotification)".data(using: String.Encoding.utf8)!)
    postData.append("&ishaNotification=\(ishaNotification)".data(using: String.Encoding.utf8)!)
    postData.append("&fajrAlarm=\(fajrAlarm)".data(using: String.Encoding.utf8)!)
    postData.append("&dhudrAlarm=\(dhudrAlarm)".data(using: String.Encoding.utf8)!)
    postData.append("&asarAlarm=\(asarAlarm)".data(using: String.Encoding.utf8)!)
    postData.append("&magribAlarm=\(magribAlarm)".data(using: String.Encoding.utf8)!)
    postData.append("&ishaAlarm=\(ishaAlarm)".data(using: String.Encoding.utf8)!)
    postData.append("&languageCode=\("Arabic")".data(using: String.Encoding.utf8)!)
    postData.append("&subscriptionType=\(subscriptionType)".data(using: String.Encoding.utf8)!)

 
    
    
    let request = NSMutableURLRequest(url: NSURL(string: "\(Constant.postSignUpUserDetails)")! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = postData as Data
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error == nil) {
            let jsonString = try? JSONSerialization.jsonObject(with: data!, options:  []) as? [String:Any]
            let httpResponse = response as? HTTPURLResponse
            if  httpResponse?.statusCode == 200 {
                if let data = jsonString as? [String:Any]{
                    UserDetailModel.objUserDetailModel.nativeLogin(respose: data)
                    print(data)
                }
                self.delegate?.socialLoggedInResult(success: true, userDetail:  Constant.appManager.loggedInUser)
            }else {
                self.delegate?.socialLoggedInResult(success: false, userDetail:  Constant.appManager.loggedInUser)
                if jsonString == nil {
                    ApiResponse.alert(title: AlertMessages.alertTitle, message: "Some thing went wrong", controller: self.viewController)
                }else{
                    ApiResponse.alert(title: AlertMessages.alertTitle, message: (jsonString!?["errorMessage"] as? String)!, controller: self.viewController)
                }
            }

        }
    })
    dataTask.resume()
    }
}

extension LoginViewModel:GIDSignInDelegate
{

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!){
          print(user)
//        let userDetail = UserDetailModel(json: JSON())
        if error != nil {
            print(error)
            self.delegate?.socialLoggedInResult(success: false, userDetail: Constant.appManager.loggedInUser)
        }
        else
        {
            Constant.appManager.loggedInUser.fullName = GIDSignIn.sharedInstance().currentUser.profile.name
            print(Constant.appManager.loggedInUser.fullName!)
            Constant.appManager.loggedInUser.email = GIDSignIn.sharedInstance().currentUser.profile.email
            print(Constant.appManager.loggedInUser.email!)
            Constant.appManager.loggedInUser.clientID = GIDSignIn.sharedInstance()?.currentUser.userID
            Constant.appManager.loggedInUser.serverClientID = GIDSignIn.sharedInstance()?.clientID
            Constant.appManager.loggedInUser.image = GIDSignIn.sharedInstance().currentUser.profile.imageURL(withDimension: 200)?.absoluteString
//            self.googleApiPost(clientId: Constant.appManager.loggedInUser.clientID!)
            Constant.appManager.loggedInUser.usereType = Constant.UserSignUpType.google
            Constant.appManager.loggedInUser.isAlreadySignedUp = true
            self.delegate?.socialLoggedInResult(success: true, userDetail: Constant.appManager.loggedInUser)
        }
    }
  
    func googleApiPost(userName: String,firstName:String,lastName:String,email:String,phoneNumber:String,fajrNotification:Bool,dhudrNotification:Bool,asarNotification:Bool,magribNotification:Bool,ishaNotification:Bool,fajrAlarm: Bool,dhudrAlarm:Bool,asarAlarm:Bool,magribAlarm:Bool,ishaAlarm:Bool,languageCode:String,subscriptionType: String,provider:String,externalUserId:String)
    {
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            ]
        
        let postData = NSMutableData(data: "grant_type=password".data(using: String.Encoding.utf8)!)
        let url = Constant.PostSocialloginUserDetails
        postData.append("&userName=\(userName)".data(using: String.Encoding.utf8)!)
        postData.append("&firstName=\(firstName)".data(using: String.Encoding.utf8)!)
        postData.append("&email=\(email)".data(using: String.Encoding.utf8)!)
        postData.append("&phoneNumber=\(phoneNumber)".data(using: String.Encoding.utf8)!)
        postData.append("&fajrNotification=\(fajrNotification)".data(using: String.Encoding.utf8)!)
        postData.append("&dhudrNotification=\(dhudrNotification)".data(using: String.Encoding.utf8)!)
        postData.append("&asarNotification=\(asarNotification)".data(using: String.Encoding.utf8)!)
        postData.append("&magribNotification=\(magribNotification)".data(using: String.Encoding.utf8)!)
        postData.append("&ishaNotification=\(ishaNotification)".data(using: String.Encoding.utf8)!)
        postData.append("&fajrAlarm=\(fajrAlarm)".data(using: String.Encoding.utf8)!)
        postData.append("&dhudrAlarm=\(dhudrAlarm)".data(using: String.Encoding.utf8)!)
        postData.append("&asarAlarm=\(asarAlarm)".data(using: String.Encoding.utf8)!)
        postData.append("&ishaAlarm=\(ishaAlarm)".data(using: String.Encoding.utf8)!)
        postData.append("&magribAlarm=\(magribAlarm)".data(using: String.Encoding.utf8)!)
        postData.append("&languageCode=\(languageCode)".data(using: String.Encoding.utf8)!)
        postData.append("&subscriptionType=\(subscriptionType)".data(using: String.Encoding.utf8)!)
        postData.append("&provider=\(provider)".data(using: String.Encoding.utf8)!)
        postData.append("&externalUserId=\(externalUserId)".data(using: String.Encoding.utf8)!)
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error == nil) {
                print(error)
                let jsonString = try? JSONSerialization.jsonObject(with: data!, options:  []) as? [String:Any]

                let httpResponse = response as? HTTPURLResponse
                print(httpResponse as Any)
                if httpResponse?.statusCode == 200{
                    let jsonString = try? JSONSerialization.jsonObject(with: data!, options:  [])
                    print(jsonString!)
                    self.delegate?.socialLoggedInResult(success: true, userDetail:  Constant.appManager.loggedInUser)

                }else{
                    self.delegate?.socialLoggedInResult(success: false, userDetail:  Constant.appManager.loggedInUser)
                    if jsonString == nil {
                        ApiResponse.alert(title: AlertMessages.alertTitle, message: "Some thing went wrong", controller: self.viewController)
                    }else{
                        ApiResponse.alert(title: AlertMessages.alertTitle, message: (jsonString!?["errorMessage"] as? String)!, controller: self.viewController)
                    }
                }
            }
        })
        
    dataTask.resume()
}

   private func signIn(signIn: GIDSignIn!, didDisconnectWithUser user: GIDGoogleUser!, withError error: NSError!) {
  }
}
