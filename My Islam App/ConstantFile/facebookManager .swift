//
//  facebookManager .swift
//  My Islam App
//
//  Created by Apple on 30/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import FBSDKLoginKit
class FacebookSignInManager: NSObject {
    typealias LoginCompletionBlock = (Dictionary<String, AnyObject>?, NSError?) -> Void
    
    //MARK:- Public functions
    class func basicInfoWithCompletionHandler(_ fromViewController:AnyObject, onCompletion: @escaping LoginCompletionBlock) -> Void {
       
        self.getBaicInfoWithCompletionHandler(fromViewController) { (dataDictionary:Dictionary<String, AnyObject>?, error: NSError?) -> Void in
            onCompletion(dataDictionary, error)
        }
    }
    
    class func logoutFromFacebook() {
        FBSDKLoginManager().logOut()
        FBSDKAccessToken.setCurrent(nil)
        FBSDKProfile.setCurrent(nil)
    }
    
    //MARK:- Private functions
    class fileprivate func getBaicInfoWithCompletionHandler(_ fromViewController:AnyObject, onCompletion: @escaping LoginCompletionBlock) -> Void {
        let permissionDictionary = [
            "fields" : "id,name,first_name,last_name,gender,email,birthday,picture.type(large)",
            //"locale" : "en_US"
        ]
        if FBSDKAccessToken.current() != nil {
            
            FBSDKGraphRequest(graphPath: "/me", parameters: permissionDictionary)
                .start(completionHandler:  { (connection, result, error) in
                    
                    print(result as Any)
                    
                    if error == nil {
                        onCompletion(result as? Dictionary<String, AnyObject>, nil)
                    } else {
                        onCompletion(nil, error as NSError?)
                    }
                })
            
        } else {
            FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile", "user_photos"], from: fromViewController as? UIViewController, handler: { (result, error) -> Void in
                if error != nil {
                    FBSDKLoginManager().logOut()
                    if let error = error as NSError? {
                        let errorDetails = [NSLocalizedDescriptionKey : "Processing Error. Please try again!"]
                        let customError = NSError(domain: "Error!", code: error.code, userInfo: errorDetails)
                        onCompletion(nil, customError)
                    } else {
                        onCompletion(nil, error as NSError?)
                    }
                    
                } else if (result?.isCancelled)! {
                    FBSDKLoginManager().logOut()
                    let errorDetails = [NSLocalizedDescriptionKey : "Request cancelled!"]
                    let customError = NSError(domain: "Request cancelled!", code: 1001, userInfo: errorDetails)
                    onCompletion(nil, customError)
                } else {
                    let pictureRequest = FBSDKGraphRequest(graphPath: "me", parameters: permissionDictionary)
                    let _ = pictureRequest?.start(completionHandler: {
                        (connection, result, error) -> Void in
                        
                        if error == nil {
                            onCompletion(result as? Dictionary<String, AnyObject>, nil)
                        } else {
                            onCompletion(nil, error as NSError?)
                        }
                    })
                }
            })
        }
    }
}
