//
//  NhomCo+CoreDataProperties.swift
//  AppJEFIT
//
//  Created by ADMIN on 7/1/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//
//

import Foundation
import CoreData


extension NhomCo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NhomCo> {
        return NSFetchRequest<NhomCo>(entityName: "NhomCo")
    }

    @NSManaged public var hinh: String?
    @NSManaged public var id: Int16
    @NSManaged public var ten: String?

}
