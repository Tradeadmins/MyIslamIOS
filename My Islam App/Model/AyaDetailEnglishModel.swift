//
//  AyaDetailModel.swift
//  My Islam App
//
//  Created by Apple on 14/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class Ayat: NSObject {
    var index:String?
    var text:String?
}

class Sura: NSObject {
    var Ayats:[Ayat] = []
    var text:String = ""
}
