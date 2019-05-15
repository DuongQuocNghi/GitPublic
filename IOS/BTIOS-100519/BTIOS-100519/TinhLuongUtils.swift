//
//  TinhLuongUtils.swift
//  BTIOS-100519
//
//  Created by ADMIN on 5/15/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import Foundation

enum ENhanVien:String {
    case None
    case NVVP = "Nhân viên Văn phòng"
    case NVKD = "Nhân viên Kinh doanh"
    case CN = "Công nhân"
}

class TinhLuongUtils {
    
    let LCB:Double = 1500000
    
    func TinhLuong(loaiNV:ENhanVien,thamNien:Int=0,heSoLuong:Double=0,doanhThu:Double=0, phanTramHoaHong:Double=0,sanLuong:Int=0, thuong:Float = 1) -> String {
        var r:Double = 0
        
        switch loaiNV {
        case .NVVP:
            r = TinhLuongNVVP(thamNien: thamNien, heSoLuong: heSoLuong)
            break
        case .NVKD:
            r = TinhLuongNVKD(doanhThu: doanhThu, phanTramHoaHong: phanTramHoaHong)
            break
        case .CN:
            r = TinhLuongCN(sanLuong: sanLuong, heSoLuong: heSoLuong)
            break
        default:
            break
        }
        r = r * Double(thuong)
        return String(format: "%.2f", r)
    }
    
    func TinhLuongNVVP(thamNien:Int, heSoLuong:Double) -> Double {
        if(thamNien<10){
            return heSoLuong * LCB + (1*LCB) ;
        }else{
            return heSoLuong * LCB + (1.2*LCB) ;
        }
    }
    
    func TinhLuongNVKD(doanhThu:Double, phanTramHoaHong:Double) -> Double {
        return LCB + (doanhThu * phanTramHoaHong);
    }
    
    func TinhLuongCN(sanLuong:Int,heSoLuong:Double) -> Double {
        if(sanLuong<1000){
            return heSoLuong * LCB + (1*LCB) ;
        }else{
            return heSoLuong * LCB + (1.5*LCB) ;
        }
        
    }
}
