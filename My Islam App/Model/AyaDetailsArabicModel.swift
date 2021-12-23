//
//  AyaDetailsArabicModel.swift
//  My Islam App
//
//  Created by Apple on 14/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class AyatArabicDetails: NSObject {
    var index:String?
    var text:String?
}

class SuraArabicDetails: NSObject {
    var ayatsArabic:[AyatArabicDetails] = []
    var text:String = ""
}
