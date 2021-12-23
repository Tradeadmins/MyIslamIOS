//
//  AlllAyaDetailsModel.swift
//  My Islam App
//
//  Created by Apple on 08/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit
class AlllAyaDetailsModel {
    
    var strTotalAya :String = String()
    var suraIndexNumber:String = String()
    var ayaIndexNumber:String = String()
    
    init(AyaDetail:NSDictionary) {
        self.strTotalAya = AyaDetail["_index"] as! String
        self.suraIndexNumber = AyaDetail["_text"] as! String
        self.ayaIndexNumber = AyaDetail["_index"] as! String
    }
}
