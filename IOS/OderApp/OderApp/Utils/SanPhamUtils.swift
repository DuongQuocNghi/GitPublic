//
//  SanPhamUtils.swift
//  OderApp
//
//  Created by ADMIN on 5/29/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import Foundation

class SanPhamUtils {
    var sanPhamList = [SanPhamModel]()
    var sanPhamNuocList = [SPNuocModel]()
    var sanPhamThucAnList = [SPThucAnModel]()
    
    func dumpData() {
        ThemSP(SanPhamModel("Cà phê Trung nguyên", 95000, "Cà phê của sự giàu có và hạnh phúc", "https://bitly.vn/49s8"))
        ThemSP(SPThucAnModel("Bánh mì", 20000, "Bánh mì Hà Nội", "https://bitly.vn/45bg",thucAnNhanh: true))
        ThemSP(SPThucAnModel("Cơm tắm", 25000, "Cơm tắm bình dân", "https://bitly.vn/49rq"))
        ThemSP(SPNuocModel("Cà phê đá", 20000, "Cà phê Sài Gòn Xưa", "https://bitly.vn/45bt",luongDa: 0))
    }
    
    
    func ThemSP(_ sanPham:SanPhamModel) -> Bool {
        sanPhamList.append(sanPham)
        return true
    }
    
    func ThemSP(_ sanPham:SPNuocModel) -> Bool {
        sanPhamNuocList.append(sanPham)
        return true
    }
    
    func ThemSP(_ sanPham:SPThucAnModel) -> Bool {
        sanPhamThucAnList.append(sanPham)
        return true
    }
}
