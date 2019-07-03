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
        initData();
    }
    
    func initData() {
        if(getAll().count == 0){
            
            themNhomCo(id: 12, ten: "Core", hinh: "bp_m_abs")
            themNhomCo(id: 0, ten: "Core", hinh: "bp_f_abs")
            
            themNhomCo(id: 13, ten: "Show All", hinh: "bp_m_all")
            themNhomCo(id: 1, ten: "Show All", hinh: "bp_f_all")
            
            themNhomCo(id: 14, ten: "Back", hinh: "bp_m_back")
            themNhomCo(id: 2, ten: "Back", hinh: "bp_f_back")
            
            themNhomCo(id: 15, ten: "Biceps", hinh: "bp_m_biceps")
            themNhomCo(id: 3, ten: "Biceps", hinh: "bp_f_biceps")
        
            themNhomCo(id: 16, ten: "Calves", hinh: "bp_m_calves")
            themNhomCo(id: 4, ten: "Calves", hinh: "bp_f_calves")
            
            themNhomCo(id: 17, ten: "Cardio", hinh: "bp_m_cardio")
            themNhomCo(id: 5, ten: "Cardio", hinh: "bp_f_cardio")
            
            themNhomCo(id: 18, ten: "Chest", hinh: "bp_m_chest")
            themNhomCo(id: 6, ten: "Chest", hinh: "bp_f_chest")
            
            themNhomCo(id: 19, ten: "Forearms", hinh: "bp_m_forearms")
            themNhomCo(id: 7, ten: "Forearms", hinh: "bp_f_forearms")
            
            themNhomCo(id: 20, ten: "Glutes", hinh: "bp_m_glutes")
            themNhomCo(id: 8, ten: "Glutes", hinh: "bp_f_glutes")
            
            themNhomCo(id: 21, ten: "Shoulders", hinh: "bp_m_shoulders")
            themNhomCo(id: 9, ten: "Shoulders", hinh: "bp_f_shoulders")
            
            themNhomCo(id: 22, ten: "Thigh", hinh: "bp_m_thigh")
            themNhomCo(id: 10, ten: "Thigh", hinh: "bp_f_thigh")
            
            themNhomCo(id: 23, ten: "Triceps", hinh: "bp_m_triceps")
            themNhomCo(id: 11, ten: "Triceps", hinh: "bp_f_triceps")
        }
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
    
    func getAll() -> [NhomCo] {
        var result = [NhomCo]()
        NhomCo.getAll(sucess: { data in
            guard let dataNhomCo = data as? [NhomCo] else{
                print("Could not cast value of type NhomCo")
                return
            }
            result = dataNhomCo
        }) { (Error) in
            print(Error)
        }
        return result
    }
}
