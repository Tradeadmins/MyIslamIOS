//
//  PrayerTrackerNotificationTiming+CoreDataProperties.swift
//  My Islam App
//
//  Created by Apple on 19/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//
//

import Foundation
import CoreData


extension PrayerTrackerNotificationTiming {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PrayerTrackerNotificationTiming> {
        return NSFetchRequest<PrayerTrackerNotificationTiming>(entityName: "PrayerTrackerNotificationTiming")
    }

    @NSManaged public var id: String?
    @NSManaged public var timing: String?
    @NSManaged public var aStatus: String?
    @NSManaged public var ptracker: String?

}
