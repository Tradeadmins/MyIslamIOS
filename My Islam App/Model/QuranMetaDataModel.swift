//
//  QuranMetaDataModel.swift
//  My Islam App
//
//  Created by Apple on 08/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//


import Foundation
import UIKit

class QuranMetaDataModel {
    var juzIndexNumber :String = String()
    var suraIndexNumber:String = String()
    var ayaIndexNumber:String = String()
  
    init(juzData:NSDictionary) {
        self.juzIndexNumber = juzData["_index"] as! String
        self.suraIndexNumber = juzData["_sura"] as! String
        self.ayaIndexNumber = juzData["_aya"] as! String
    }
}
