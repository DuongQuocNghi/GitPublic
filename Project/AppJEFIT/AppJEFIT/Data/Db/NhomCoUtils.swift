//
//  NhomCoUtils.swift
//  AppJEFIT
//
//  Created by ADMIN on 7/1/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit
import CoreData

class NhomCoUtils {

    var context: NSManagedObjectContext!
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func themNhomCo(id:Int, ten:String, hinh:String) -> Bool {
        var result = false
        
        var nhomCo = NhomCo(context: context)
        nhomCo.hinh = hinh
        nhomCo.id = Int16(id)
        nhomCo.ten = ten
        
        nhomCo.save(sucess: {
            print("Them Nhom Co Sucess")
            result = true
        }) { (error) in
            print("Them Nhom Co Error: \(error)")
        }
        return result
    }
    
    func getAllNhomCo() -> [NhomCoModel] {
        var result = [NhomCoModel]()
        
        
        return result
    }
}
