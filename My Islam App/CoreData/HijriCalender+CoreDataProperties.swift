//
//  HijriCalender+CoreDataProperties.swift
//  My Islam App
//
//  Created by Apple on 19/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//
//

import Foundation
import CoreData


extension HijriCalender {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HijriCalender> {
        return NSFetchRequest<HijriCalender>(entityName: "HijriCalender")
    }

    @NSManaged public var date: String?
    @NSManaged public var hijriArDay: String?
    @NSManaged public var hijriEnDay: String?
    @NSManaged public var hijriEnMonth: String?
    @NSManaged public var hjriArMonth: String?

}
