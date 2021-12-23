//
//  QuranSuraMetaModel.swift
//  My Islam App
//
//  Created by Apple on 08/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

class QuranSuraMetaModel {
    var suraIndexNumber :String = String()
    var ayaCount :String = String()
    var suraNameArabic:String = String()
    var suraNameEnglish:String = String()
    var suraHeading:String = String()
    
    init(SuraData:NSDictionary) {
        self.suraIndexNumber = SuraData["_index"] as! String
        self.ayaCount = SuraData["_ayas"] as! String
        self.suraNameArabic = SuraData["_name"] as! String
        self.suraNameEnglish = SuraData["_tname"] as! String
        self.suraHeading = SuraData["_ename"] as! String
    }
}
