//
//  storyboard.swift
//  My Islam App
//
//  Created by Apple on 28/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryboard : String {
    case Main =   "Main"
    case Quran =  "Quran"
    case Faith =  "Faith"
    case Setting = "Setting"
    var  instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}
