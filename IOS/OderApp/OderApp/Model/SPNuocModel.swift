//
//  SPNuocModel.swift
//  OderApp
//
//  Created by ADMIN on 5/27/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import Foundation

class SPNuocModel: SanPhamModel {
    var LuongDa : Float?
    var LuongDuong : Float?
    
    init(_ name: String, _ gia: Double, _ moTa: String, _ hinhAnh: String,luongDa : Float = 0.8,luongDg : Float = 0.8 ) {
        super.init(name, gia, moTa, hinhAnh)
        LuongDa = luongDa
        LuongDuong = luongDg
    }
    
    override func GiaKhuyenMai() -> Double? {
        guard let gia = super.GiaKhuyenMai() else{
            return nil
        }
        
        return gia*0.95
    }
    
    func GiaKhuyenMai(giam:Float) -> Double? {
        guard let gia = GiaTien else{
            return nil
        }
        
        return gia*Double((1-giam))
    }
    
}
