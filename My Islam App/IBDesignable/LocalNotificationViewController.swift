//
//  LocalNotificationViewController.swift
//  My Islam App
//
//  Created by Apple on 08/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import UserNotifications

class LocalNotificationViewController: UIViewController ,UNUserNotificationCenterDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
     UNUserNotificationCenter.current().delegate = self
   
    }
    
    @IBAction func buton(_ sender: Any) {
        
//
//        var localNotification = UILocalNotification()
//        localNotification.fireDate = NSDate(timeIntervalSinceNow: 1) as Date
//        localNotification.alertBody = "This is local notification from Swift 2.0"
//        localNotification.timeZone = NSTimeZone.local
////        localNotification.repeatInterval = NSCalendar.Unit.CalendarUnitMinute
//        localNotification.userInfo = ["Important":"Data"];
//        localNotification.soundName = UILocalNotificationDefaultSoundName
//        localNotification.applicationIconBadgeNumber = 5
//        localNotification.category = "Message"
//
//        UIApplication.shared.scheduleLocalNotification(localNotification)
//
//    }
//
////        let notification = UILocalNotification()
////        notification.fireDate = NSDate(timeIntervalSinceNow: 1) as Date
////        notification.alertBody = "Hey you! Yeah you! Swipe to unlock!"
////        notification.alertAction = "be awesome!"
////        notification.soundName = UILocalNotificationDefaultSoundName
////        UIApplication.shared.scheduleLocalNotification(notification)
////
////
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Congratulations!!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "You have sent notification successfully!", arguments: nil)
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "notify-test"
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest.init(identifier: "Congratulations!!...\n you have sent notification successfully", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 20) as Date
        notification.alertBody = "Hey you! Yeah you! Swipe to unlock!"
        notification.alertAction = "be awesome!"
        notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.shared.scheduleLocalNotification(notification)
        center.add(request)
    
    }
    
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler:
        @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let alert = UIAlertController(title: notification.request.content.title, message:  notification.request.content.body, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            print("Okay'd")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
            print("cancelled")
        }))
        self.present(alert, animated: true, completion: nil)
        
      
        
        
        
//
//        let alert = UIAlertController(
//            title: notification.request.content.title,
//            message: notification.request.content.body,
//            preferredStyle: .alert)
//        let okAction = UIAlertAction(
//            title: "OK",
//            style: .default,
//            handler: nil)
//        alert.addAction(okAction)
//        present(alert, animated: true, completion: nil)
    }
}
