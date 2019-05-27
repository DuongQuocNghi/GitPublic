//
//  SanPhamModel.swift
//  OderApp
//
//  Created by ADMIN on 5/27/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import Foundation

public class SanPhamModel {
    var GiaTien :Double?
    var Ten : String?
    var Mota : String?
    var Hinh : String?
    var Loai : Loai?
    
    init(_ name:String, _ gia:Double, _ moTa:String, _ hinhAnh:String) {
        self.Ten = name
        self.GiaTien = gia
        self.Mota = moTa
        self.Hinh = hinhAnh
    }
    
    func GiaKhuyenMai() -> Double? {
        if GiaTien == nil{
            return nil
        }
        return GiaTien!*0.8
    }
    
    public enum Loai {
        case Tra
        case Cafe
    }
}
