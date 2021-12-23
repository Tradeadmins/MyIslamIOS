//
//  ZurMetaDataModel.swift
//  My Islam App
//
//  Created by Apple on 14/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
class ZuzMetaModel {
    var juzIndexNumber :String = String()
    var juzCount :String = String()
    var juzNameArabic:String = String()
    var juzNameEnglish:String = String()
    var juzHeading:String = String()
    
    
    init(SuraData:NSDictionary) {
        self.juzIndexNumber = SuraData["_index"] as! String
        self.juzCount = SuraData["_aya"] as! String
//        self.juzNameArabic = SuraData["_name"] as! String
//        self.juzNameEnglish = SuraData["_tname"] as! String
//        self.juzHeading = SuraData["_ename"] as! String
    }
}
