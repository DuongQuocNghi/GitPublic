//
//  SetTimeUtils.swift
//  AppJEFIT
//
//  Created by ADMIN on 7/12/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit
import CoreData

class SetTimeUtils {
    var context: NSManagedObjectContext!
    
    init(context: NSManagedObjectContext) {
        self.context = context
        initData();
    }
    
    func initData() {
        if(getAll().count == 0){
            themSetTime(maBT: 0, soLan: 2, thoiGianNghi: 15, thoiGianTap: 35)
            themSetTime(maBT: 1, soLan: 1, thoiGianNghi: 5, thoiGianTap: 19)
            themSetTime(maBT: 2, soLan: 5, thoiGianNghi: 2, thoiGianTap: 20)
            themSetTime(maBT: 3, soLan: 6, thoiGianNghi: 10, thoiGianTap: 15)
        }
    }
    
    func themSetTime(maBT: Int32, soLan: Int32, thoiGianNghi: Int32, thoiGianTap: Int32) -> Bool {
        var result = false
        
        var st = SetTime(context: context)
        
        st.maBaiTap = maBT
        st.soLan = soLan
        st.thoiGianNghi = thoiGianNghi
        st.thoiGianTap = thoiGianTap
        
        st.save(sucess: {
            print("Them SetTime Sucess")
            result = true
        }) { (Error) in
            print("Them SetTime Error: \(Error)")
        }
        
        return result
    }
    
    func getBy(id: Int32) -> SetTime? {
        var result : SetTime?
    
        do {
            var e = try NSPredicate(format: "maBaiTap = %@", String(id))
            SetTime.getByCause(predicate: e,sucess: { data in
                guard let dataItems = data as? [SetTime] else {
                    print("Could not cast value of type SetTime")
                    return
                }
                if dataItems.count > 0{
                    result = dataItems.first!
                }
            }) { (Error) in
                print(Error)
            }
        } catch {
            print(error)
        }
        
        
        
        return result
    }
    
    func getAll() -> [SetTime] {
        var result = [SetTime]()
        
        SetTime.getAll(sucess: { data in
            guard let dataPT = data as? [SetTime] else {
                print("Could not cast value of type SetTime")
                return
            }
            result = dataPT
        }) { (Error) in
            print(Error)
        }
        return result
    }
    
}
