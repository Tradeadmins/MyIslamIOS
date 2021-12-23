//
//  SignUpUserDetail.swift
//  My Islam App
//
//  Created by Apple on 11/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class signUpUserDetails: NSObject {
    var id :Int?
    var strFirstName :String? =  ""
    var strLastName :String? =  ""
    var strEmail :String? =  ""
    var strContactNumber:Int?
    var strType:Int?
    
    init(json:JSON) {
        
        self.strFirstName = json["firstName"].stringValue
        self.strLastName = json["firstName"].stringValue
        self.strEmail = json["firstName"].stringValue
        self.strContactNumber = json["firstName"].intValue
    }
}
