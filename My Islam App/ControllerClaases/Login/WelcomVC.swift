//
//  WelcomVC.swift
//  My Islam App
//
//  Created by Apple on 21/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Foundation
import UserNotifications

class WelcomVC: BaseViewController,UNUserNotificationCenterDelegate {
     // MARK: - property declaration
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableviewHeader: UIView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var loginBtn: UIButton!
    

    // MARK: - View Controller lyfe cyle
     override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.value(forKey: "date") == nil{
             UserDefaults.standard.set("today", forKey: "date")
             self.quranNotificationData()
        }else{
           
        }

       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true

        self.localization()
       }
    // MARK: - View Controller lyfe cyle


    }
    func quranNotificationData(){
        let url = "http://api.aladhan.com/v1/calendar?latitude=22.719568&longitude=75.857727&method=1&month=2&year=2019"
        ApiResponse.onResponseGet(url: url) { (response, error) in
            if  let responseData = response["data"] as? [[String:Any]]{
                print(responseData)
                coreDataConfiguration.objCoreDataConnection.SaveNotificationTimingData(responseData: responseData)
            }
        }
    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if let headerView = self.tableview.tableHeaderView {
            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var headerFrame = headerView.frame
            //Comparison necessary to avoid infinite loop
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                headerView.frame = headerFrame
                self.tableview.tableHeaderView = headerView
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func loginAction(_ sender: Any) {
        coreDataConfiguration.objCoreDataConnection.getTimingForNotification()
      
        let register = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "SecondLoginViewController") as! SecondLoginViewController
       self.navigationController?.pushViewController(register, animated: true)
    }

    

    // MARK: -localization method
    func localization() {
        let attributedString = NSMutableAttributedString(string: "The spelling mistakes in the text had been highlighted in green. The text is finished, but the pictures will have to be pasted in later.You need to demonstrate to the examiners that you have more than a literal understanding of the text.The students are reading Lord of the Flies as one of their set texts this year.At this point in the speech, the minister departed from his prepared text")
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 3 // Whatever line spacing you want in points
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        // *** Set Attributed String to your label ***
        welcomeMsg.font = UIFont(name:"JosefinSans-Regular", size: 15)//Set your font name here
        welcomeMsg.attributedText = attributedString
        welcomeMsg.textAlignment = NSTextAlignment.center
        welcomeToMyIshlam.text = "Welcome to My Islam".localized
        welcomeToMyIshlam.font = UIFont(name:"JosefinSans-SemiBold", size: 19)//S
        welcomeMsg.text = "WelcomeText".localized
        loginBtn.setTitle("Next".localized, for: .normal)
    }

}

