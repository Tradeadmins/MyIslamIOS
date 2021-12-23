//
//  SettingsVC.swift
//  My Islam App
//
//  Created by Apple on 23/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


class SettingsVC: UIViewController {
    // MARK: - property declaration
    var numberArray = ["My Account","Prayer Time & Adhan","Adhan Notification","The Quran","Audio Recitation","Translation","Arabic Text View","Islamic Calender","Mosque And Halal","Laguage","Terms & Condition ","Privacy Policy","Acknoledgement","Contact Us","FreedBack"]
    
    // MARK: - View Controller lyfe cyle
    override func viewDidLoad() {
        super.viewDidLoad()
      }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    @IBAction func backBtn(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - Tableview datasource & delegates
extension SettingsVC : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Settingcell") as! Settingcell
        cell.lbl_settingName?.text =  numberArray[indexPath.row]

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
//        case 0: //For "one"
//            let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "UserAccountVC") as! UserAccountVC
//            self.navigationController?.pushViewController(register, animated: true)
//        case 1: //For "two"
//            let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "PrayerTime_AdhansVC") as! PrayerTime_AdhansVC
//            self.navigationController?.pushViewController(register, animated: true)
  


        default: break //For "three"
            
            
        }
        
    }
    
    
}

