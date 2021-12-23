//
//  QuranNotificationDetailsViewModel.swift
//  My Islam App
//
//  Created by Apple on 18/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class QuranNotificationDetailsViewModel: NSObject {
    
   var welcomeViewController:WelcomVC?
    
    func quranNotificationData(){
        let url = "http://api.aladhan.com/v1/calendar?latitude=22.719568&longitude=75.857727&method=1&month=3&year=2019"
        ApiResponse.onResponseGet(url: url) { (response, error) in
            // print(response)
            if  let responseData = response["data"] as? [[String:Any]]{
                print(responseData)
                coreDataConfiguration.objCoreDataConnection.SaveNotificationTimingData(responseData: responseData)
              }
         }
    }
}
