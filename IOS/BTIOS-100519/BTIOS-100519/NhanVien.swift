//
//  NhanVien.swift
//  BTIOS-100519
//
//  Created by ADMIN on 5/15/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import Foundation

class NhanVien {
    var ID:String?
    var Name:String?
    var Loai:String?
    var Sex:String?
    var Address:String?
    var StartDate:String?
    var Birthday:String?
    
    init(id:String = "",name:String = "", loai:String = "", sex:String = "",address:String = "",startDate:String = "",birthday:String = "" ) {
        Name = name
        Loai = loai
        Sex = sex
        Address = address
        StartDate = startDate
        Birthday = birthday
        ID = id
    }
}
