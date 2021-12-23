//
//  NotificationsTimings+CoreDataProperties.swift
//  My Islam App
//
//  Created by Apple on 19/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//
//

import Foundation
import CoreData


extension NotificationsTimings {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotificationsTimings> {
        return NSFetchRequest<NotificationsTimings>(entityName: "NotificationsTimings")
    }

    @NSManaged public var asr: String?
    @NSManaged public var fajr: String?
    @NSManaged public var imsak: String?
    @NSManaged public var isha: String?
    @NSManaged public var maghrib: String?
    @NSManaged public var midnight: String?
    @NSManaged public var sunrise: String?
    @NSManaged public var sunset: String?
    @NSManaged public var dhuhr: String?

}
