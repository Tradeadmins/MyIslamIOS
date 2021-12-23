//
//  SubscriptionViewController.swift
//  My Islam App
//
//  Created by Apple on 12/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SubscriptionViewController: UIViewController {
    // MARK: - property declaration
    
    // MARK: - IBOutlet
    @IBOutlet weak var FreeTrailBtn: UIButton!
    
    // MARK: - View Controller lyfe cyle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

    }
    // MARK: - IBActions
    @IBAction func FreeTrailBtn(_ sender: Any) {
        Constant.appManager.loggedInUser.freeTrail = "Trail"
        let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "ChooseNotificationForEachPrayerVC") as! ChooseNotificationForEachPrayerVC
        self.navigationController?.pushViewController(register, animated: true)
    }
    @IBAction func monthlySubscriptionBtn(_ sender: Any) {
        Constant.appManager.loggedInUser.monthlySubscription = "Monthly"
        let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "ChooseNotificationForEachPrayerVC") as! ChooseNotificationForEachPrayerVC
        self.navigationController?.pushViewController(register, animated: true)
    }
   
    @IBAction func yearlySubscriptionBtn(_ sender: Any) {
        Constant.appManager.loggedInUser.yearlySubscription = "Yearly"
        let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "ChooseNotificationForEachPrayerVC") as! ChooseNotificationForEachPrayerVC
        self.navigationController?.pushViewController(register, animated: true)
    }
}
