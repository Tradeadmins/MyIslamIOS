//
//  GregorianCalender+CoreDataProperties.swift
//  My Islam App
//
//  Created by Apple on 19/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//
//

import Foundation
import CoreData


extension GregorianCalender {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GregorianCalender> {
        return NSFetchRequest<GregorianCalender>(entityName: "GregorianCalender")
    }

    @NSManaged public var date: String?
    @NSManaged public var day: String?
    @NSManaged public var month: String?

}
