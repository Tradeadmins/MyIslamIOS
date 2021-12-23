//
//  NotificationEntities+CoreDataProperties.swift
//  My Islam App
//
//  Created by Apple on 19/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//
//

import Foundation
import CoreData


extension NotificationEntities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotificationEntities> {
        return NSFetchRequest<NotificationEntities>(entityName: "NotificationEntities")
    }

    @NSManaged public var date: String?
    @NSManaged public var gregorian: GregorianCalender?
    @NSManaged public var hijriCalender: HijriCalender?
    @NSManaged public var notifications: NotificationsTimings?
    @NSManaged public var timings: NotificationsTimings?
    @NSManaged public var notificationTracker: NSSet?

}

// MARK: Generated accessors for notificationTracker
extension NotificationEntities {

    @objc(addNotificationTrackerObject:)
    @NSManaged public func addToNotificationTracker(_ value: PrayerTrackerNotificationTiming)

    @objc(removeNotificationTrackerObject:)
    @NSManaged public func removeFromNotificationTracker(_ value: PrayerTrackerNotificationTiming)

    @objc(addNotificationTracker:)
    @NSManaged public func addToNotificationTracker(_ values: NSSet)

    @objc(removeNotificationTracker:)
    @NSManaged public func removeFromNotificationTracker(_ values: NSSet)

}
