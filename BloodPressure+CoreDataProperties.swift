//
//  BloodPressure+CoreDataProperties.swift
//  testest
//
//  Created by 林秀謙 on 2023/9/12.
//
//

import Foundation
import CoreData


extension BloodPressure {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BloodPressure> {
        return NSFetchRequest<BloodPressure>(entityName: "BloodPressure")
    }

    @NSManaged public var mdate: Date?
    @NSManaged public var sbp: Int16
    @NSManaged public var dbp: Int16

}

extension BloodPressure : Identifiable {

}
