//
//  NhanViewUtils.swift
//  BTIOS-100519
//
//  Created by ADMIN on 5/17/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import Foundation

class NhanViewUtils {
    
    var nhanVienList = [String:NhanVien]()
    
    func themNhanVien(nhanVien:NhanVien) -> Bool {
        if(nhanVienList[nhanVien.ID ?? ""] == nil){
            nhanVienList[nhanVien.ID!] = nhanVien
        }else{
            return false
        }
        return true
    }
    
    func xoaNhanVien(id:String) -> Bool {
        for (key,_) in nhanVienList{
            if(id == key){
                nhanVienList.removeValue(forKey: key)
                return true
            }
        }
        return false
    }
    
    func timNhanVienByID(id:String) -> NhanVien? {
        return nhanVienList[id]
    }
    
    func timNhanVienByStartYear(year:String) -> [NhanVien] {
        var r = [NhanVien]()
        for (_,value) in nhanVienList{
            if(year == value.StartDate){
                r.append(value)
            }
        }
        return r
    }
    
    func suaNhanVien(nhanVien:NhanVien) -> Bool {
        if(nhanVienList[nhanVien.ID ?? ""] != nil){
            nhanVienList[nhanVien.ID!] = nhanVien
        }else{
            return false
        }
        return true
    }
    
}
