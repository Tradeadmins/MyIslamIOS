//
//  TodayVC.swift
//  My Islam App
//
//  Created by Apple on 28/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TodayVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

@IBAction func settingButton(_ sender: Any){
  
        let register = AppStoryboard.Setting.instance.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(register, animated: true)

    }
    
    

  
}
