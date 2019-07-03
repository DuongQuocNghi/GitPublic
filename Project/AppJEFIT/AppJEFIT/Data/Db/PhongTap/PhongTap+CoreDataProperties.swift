//
//  PhongTap+CoreDataProperties.swift
//  AppJEFIT
//
//  Created by ADMIN on 7/3/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//
//

import Foundation
import CoreData


extension PhongTap {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhongTap> {
        return NSFetchRequest<PhongTap>(entityName: "PhongTap")
    }

    @NSManaged public var id: Int16
    @NSManaged public var ten: String?
    @NSManaged public var hinh: String?
    @NSManaged public var diaChi: String?
    @NSManaged public var gioMoCua: String?
    @NSManaged public var danhGia: Float
    @NSManaged public var lat: Double
    @NSManaged public var long: Double
    @NSManaged public var soDienThoai: String?

}
