
//
//  PhongTapUtils.swift
//  AppJEFIT
//
//  Created by ADMIN on 7/3/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit
import CoreData

class PhongTapUtils {
    
    var context: NSManagedObjectContext!
    
    init(context: NSManagedObjectContext) {
        self.context = context
        initData();
    }
    
    func initData() {
        if(getAll().count == 0){
            themPhongTap(id: 0, ten: "California Fitness & Yoga Quận 3", hinh: "gym_1", diaChi: "Tầng 2 Toà nhà Lim Tower II Số, 62A Đường Cách Mạng Tháng 8", gioMoCua: "Mở cửa đến 23:00", danhGia: 1, lat: 10.777312, long: 106.684690, soDienThoai: "0927 443 712")
            
            themPhongTap(id: 0, ten: "MMA GYM FITNESS CENTER", hinh: "gym_2", diaChi: "Phòng tập thể dục đấm bốc - 285 Võ Văn Tần", gioMoCua: "Đóng cửa lúc 21:30", danhGia: 1.4, lat: 10.778429, long: 106.687190, soDienThoai: "0711 346 222")
            
            themPhongTap(id: 0, ten: "Fit24 - Fitness & Yoga Center", hinh: "gym_3", diaChi: "Phòng tập thể dục - 02 Hồ Xuân Hương", gioMoCua: "Đóng cửa lúc 22:00", danhGia: 3.8, lat: 10.775910, long: 106.687866, soDienThoai: "0563 222 374")

            themPhongTap(id: 0, ten: "CLB Fitness T&V - phòng tập Gym, Yoga, Aerobic quận 1", hinh: "gym_4", diaChi: "Phòng tập thể dục - 55B Nguyễn Thị Minh Khai", gioMoCua: "Đóng cửa lúc 21:30", danhGia: 4.6, lat: 10.776816, long: 106.685388, soDienThoai: "0337 241 286")
        }
    }
    
    func themPhongTap(id: Int16, ten: String?, hinh: String?, diaChi: String?, gioMoCua: String?, danhGia: Float,lat: Double, long: Double, soDienThoai: String?) -> Bool {
        var result = false
        
        var pt = PhongTap(context: context)
        
        pt.danhGia = danhGia
        pt.diaChi = diaChi
        pt.gioMoCua = gioMoCua
        pt.hinh = hinh
        pt.id = id
        pt.lat = lat
        pt.long = long
        pt.soDienThoai = soDienThoai
        pt.ten = ten
        
        pt.save(sucess: {
            print("Them Phong tap Sucess")
            result = true
        }) { (Error) in
            print("Them Phong tap Error: \(Error)")
        }
        
        return result
    }
    
    func getAll() -> [PhongTap] {
        var result = [PhongTap]()
        
        PhongTap.getAll(sucess: { data in
            guard let dataPT = data as? [PhongTap] else {
                print("Could not cast value of type PhongTap")
                return
            }
            result = dataPT
        }) { (Error) in
            print(Error)
        }
        return result
    }
    
    func xeoLoai(diem: Float) -> UIImage? {
        if(diem > 0 && diem < 2){
            return UIImage(named: "marker_green")
        }else if( diem >= 2 && diem < 4){
            return UIImage(named: "marker_yellow")
        }else if(diem >= 4){
            return UIImage(named: "marker_red")
        }
        return UIImage(named: "marker_green")
    }
}
