//
//  CoreDataConnection.swift
//  My Islam App
//
//  Created by Apple on 19/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import SwiftyJSON
import UserNotifications

class coreDataConfiguration : NSObject , UNUserNotificationCenterDelegate{
    
     static let objCoreDataConnection =  coreDataConfiguration()
  
    /**
     Calling this method to `saveContext`
     and increases `saveContext to coredata`.
     - Parameter meters:  Core Data Saving support.
     - Precondition: `coredaa`.
     */
    func saveContext () {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let context = managedContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
   
    /**
     Calling this method to `Save data to notification`
     and increases `Save to coredata`.
     - Parameter meters:  Save data notification.
     - Precondition: `coredaa`.
     */
    func SaveNotificationTimingData(responseData:[[String:Any]]){
        
        let managedContext = AppDelegate.appDelegate.persistentContainer.viewContext
        //Now let’s create an entity and new user records.
        for data in responseData {
            let userEntity = NotificationEntities(context: managedContext)
            
            if  let timming  = data["timings"] as? [String:Any] {
                let timeFzr = PrayerTrackerNotificationTiming(context: managedContext)
                timeFzr.aStatus = "true"
                timeFzr.id = "Fajr"
                timeFzr.ptracker = "true"
                timeFzr.timing = timming["Fajr"] as? String
                userEntity.addToNotificationTracker(timeFzr)
                
              
                let timeAsr = PrayerTrackerNotificationTiming(context: managedContext)
                timeAsr.aStatus = "true"
                timeAsr.id = "Asr"
                timeAsr.ptracker = "true"
                timeAsr.timing = timming["Asr"] as? String
                userEntity.addToNotificationTracker(timeAsr)
               
                
                let timeDhuhr = PrayerTrackerNotificationTiming(context: managedContext)
                timeDhuhr.aStatus = "true"
                timeDhuhr.id = "Dhuhr"
                timeDhuhr.ptracker = "true"
                timeDhuhr.timing = timming["Dhuhr"] as? String
                userEntity.addToNotificationTracker(timeDhuhr)
                
                let timeImsak = PrayerTrackerNotificationTiming(context: managedContext)
                timeImsak.aStatus = "true"
                timeImsak.id = "Imsak"
                timeImsak.ptracker = "true"
                timeImsak.timing = timming["Imsak"] as? String
                userEntity.addToNotificationTracker(timeImsak)
                
                let timeIsha = PrayerTrackerNotificationTiming(context: managedContext)
                timeIsha.aStatus = "true"
                timeIsha.id = "Isha"
                timeIsha.ptracker = "true"
                timeIsha.timing = timming["Isha"] as? String
                userEntity.addToNotificationTracker(timeIsha)
                
                let timeMaghrib = PrayerTrackerNotificationTiming(context: managedContext)
                timeMaghrib.aStatus = "true"
                timeMaghrib.id = "Maghrib"
                timeMaghrib.ptracker = "true"
                timeMaghrib.timing = timming["Maghrib"] as? String
                userEntity.addToNotificationTracker(timeMaghrib)
                
                let timeSunrise = PrayerTrackerNotificationTiming(context: managedContext)
                timeSunrise.aStatus = "true"
                timeSunrise.id = "Sunrise"
                timeSunrise.ptracker = "true"
                timeSunrise.timing = timming["Sunrise"] as? String
                userEntity.addToNotificationTracker(timeSunrise)
                
                let timeSunset = PrayerTrackerNotificationTiming(context: managedContext)
                timeSunset.aStatus = "true"
                timeSunset.id = "Sunset"
                timeSunset.ptracker = "true"
                timeSunset.timing = timming["Sunset"] as? String
                userEntity.addToNotificationTracker(timeSunset)
                
            }
            if  let date  =  data["date"] as? [String:Any] {
                
                userEntity.date = date["readable"] as? String
                let georianData = date["gregorian"] as? [String:Any]
                
                let dateGeorian  = GregorianCalender(context: managedContext)
                dateGeorian.date = georianData?["date"] as? String
                dateGeorian.day = georianData?["day"] as? String
                let month = georianData?["month"] as! [String:Any]
                dateGeorian.month = month["en"] as? String
                userEntity.gregorian = dateGeorian
                
                let hijriDate = date["hijri"] as? [String:Any]

                let datehijri  = HijriCalender(context: managedContext)
                datehijri.date = hijriDate?["date"] as? String
                let weekHijri = hijriDate?["weekday"] as! [String:Any]
                datehijri.hijriArDay = weekHijri["ar"] as? String
                datehijri.hijriEnDay = weekHijri["en"] as? String

                let monthHijri = hijriDate?["month"] as! [String:Any]
                datehijri.hjriArMonth = monthHijri["ar"] as? String
                datehijri.hijriEnMonth = monthHijri["en"] as? String
                userEntity.hijriCalender = datehijri
            }
//            if  let metaData  = data["metaData"] as? [String:Any] {
//
//            }
        }
        DispatchQueue.main.async {
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }

        }
    }
    /**
     Calling this method to `Get Timing For Notification`
     and increases `Save to coredata`.
     - Parameter meters:  Get Timing For Notification.
     - Precondition: `coredaa`.
     */
    var objPrayerTrackerNotificationTiming = [PrayerTrackerNotificationTiming]()

    func getTimingForNotification() -> [NotificationEntities] {
        let request: NSFetchRequest<NotificationEntities> = NotificationEntities.fetchRequest()
        do {
            let alldata = try AppDelegate.appDelegate.persistentContainer.viewContext.fetch(request)
                alldata.forEach { data in
                objPrayerTrackerNotificationTiming = (data.notificationTracker?.allObjects as? [PrayerTrackerNotificationTiming])!
                print(objPrayerTrackerNotificationTiming.count)
                for notificationTiming in objPrayerTrackerNotificationTiming{
                    if data.date == "21 Feb 2019"{
                     
                        if notificationTiming.id?.lowercased() == "Fajr".lowercased(){
                            notificationTiming.timing = "18:15 (IST)"
                        }
                        if notificationTiming.id?.lowercased() == "Asr".lowercased(){
                            notificationTiming.timing = "19:20 (IST)"
                        }
                        if notificationTiming.id?.lowercased() == "Isha".lowercased(){
                            notificationTiming.timing = "19:25 (IST)"
                        }
                        if notificationTiming.id?.lowercased() == "Maghrib".lowercased(){
                           notificationTiming.timing = "19:30 (IST)"
                        }
                        if notificationTiming.id?.lowercased() == "Dhuhr".lowercased(){
                           notificationTiming.timing = "19:35 (IST)"
                        }
                    }
                    self.addLocalNotification(dict: ["timing":notificationTiming.timing!,
                                                     "aStatus":notificationTiming.aStatus!,
                                                     "ptracker":notificationTiming.ptracker!,
                                                     "title":notificationTiming.id!,
                                                     "date":data.date!
                        ])
                }
            }
            return alldata
        }  catch {
            fatalError("This was not supposed to happen")
        }
    }
    /**
     Calling this method to `Delete All Articles`
     and increases `Save to coredata`.
     - Parameter meters:  Delet eAll Articles.
     - Precondition: `coredaa`.
     */
    func deleteAllArticles() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let dataNotification = self.getTimingForNotification()
        dataNotification.forEach { data in
            context.delete(data)
        }
    }
/**
 Calling this method to `Add Local Notification`
 and increases `Alarm notification and Prayer notification`.
 - Parameter meters:  Add notification.
 - Precondition: `Notification`.
  */
    
    func addLocalNotification(dict:[String:Any])  {
        
       let date =  SharedData.getStringFromStringWithoutUTC(strDate: dict["date"] as! String, formatString: "dd MMM yyyy", withFormatString: "dd MM yyyy")
        
        let objArray = date.components(separatedBy: " ")
        let objTime =  dict["timing"] as! String
        
        let timingArray = objTime.replacingOccurrences(of: "(IST)", with: "", options: NSString.CompareOptions.literal, range: nil).components(separatedBy: ":")
        
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = dict["title"] as? String ?? ""
        content.body = dict["title"] as? String ?? ""
        content.categoryIdentifier = dict["title"] as? String ?? ""
        content.userInfo = ["customData": "fizzbuzz"]
        
        content.sound = UNNotificationSound.default
        var dateComponents = DateComponents()
        dateComponents.year = Int(objArray[2])
        dateComponents.month =  Int(objArray[1])
        dateComponents.day = Int(objArray[0])
        dateComponents.hour = Int(timingArray[0])
        dateComponents.minute = Int(timingArray[1].trimmingCharacters(in: .whitespaces))
        print(dateComponents)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request)
        
     
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.notification.request.content.categoryIdentifier == "categoryIdentifier" {
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                print(response.actionIdentifier)
                completionHandler()
            case "first":
                print(response.actionIdentifier)
                completionHandler()
            default:
                break;
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
    }
}
