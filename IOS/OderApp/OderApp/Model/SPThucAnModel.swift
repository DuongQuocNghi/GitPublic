//
//  SPThucAnModel.swift
//  OderApp
//
//  Created by ADMIN on 5/27/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import Foundation

class SPThucAnModel: SanPhamModel {
    var ThucAnNhanh : Bool?
    var HSD : Date?
    
    init(_ name: String, _ gia: Double, _ moTa: String, _ hinhAnh: String,thucAnNhanh : Bool = false ) {
        super.init(name, gia, moTa, hinhAnh)
        ThucAnNhanh = thucAnNhanh
    }
}
