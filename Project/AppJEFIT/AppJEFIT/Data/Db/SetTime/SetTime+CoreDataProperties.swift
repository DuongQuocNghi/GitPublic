//
//  SetTime+CoreDataProperties.swift
//  AppJEFIT
//
//  Created by ADMIN on 7/12/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//
//

import Foundation
import CoreData


extension SetTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SetTime> {
        return NSFetchRequest<SetTime>(entityName: "SetTime")
    }

    @NSManaged public var thoiGianTap: Int32
    @NSManaged public var thoiGianNghi: Int32
    @NSManaged public var soLan: Int32
    @NSManaged public var maBaiTap: Int32

}
