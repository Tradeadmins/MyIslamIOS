//
//  IshlamAppHomeVC.swift
//  My Islam App
//
//  Created by Apple on 31/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class IshlamAppHomeVC: UIViewController {
    
    // MARK: - property declaration
    
    // MARK: - IBOutlet
    @IBOutlet weak var mapview: UIView!
    @IBOutlet weak var ivCompassBack: UIImageView!
    @IBOutlet weak var ivCompassNeedle: UIImageView!
    var compassManager  : CompassDirectionManager!
    
    // MARK: - View Controller lyfe cyle
    override func viewDidLoad() {
        super.viewDidLoad()
        compassManager =  CompassDirectionManager(dialerImageView: ivCompassBack, pointerImageView: ivCompassNeedle)
        compassManager.initManager()
    }
    
    // MARK: - IBActions
    @IBAction func switchToTabbar(_ sender: Any) {
//        let register = AppStoryboard.AllTab.instance.instantiateViewController(withIdentifier: "TabbarVC") as! TabbarVC
//        self.navigationController?.pushViewController(register, animated: true)
        
    }
    
}
