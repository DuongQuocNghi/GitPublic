//
//  ThongTinNhanVienViewController.swift
//  BTIOS-100519
//
//  Created by ADMIN on 5/15/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import Foundation
import UIKit

class ThongTinNhanVienViewController: UIViewController {
    
    @IBOutlet weak var tfJob: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfStartYear: UITextField!
    @IBOutlet weak var tfSex: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var tfBirthday: UITextField!
    @IBOutlet weak var tfID: UITextField!
    
    let nhanVienUtils=NhanViewUtils()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let manhinhLuong = segue.destination as? ViewController {
            if let nv = nhanVienUtils.timNhanVienByID(id: tfID.text ?? ""){
                manhinhLuong.thongTinNhanVien = nv
            }
        }
    }
    
    @IBAction func actDelete(_ sender: Any) {
        let v = nhanVienUtils.xoaNhanVien(id: tfID.text ?? "")

        print("\(v) - \(nhanVienUtils.nhanVienList.count)")
    }
    
    @IBAction func actAdd(_ sender: Any) {
        let v = nhanVienUtils.themNhanVien(nhanVien: NhanVien(id: tfID.text ?? "",name: tfName.text ?? "", loai: tfJob.text ?? "", sex: tfSex.text ?? "", address: tfAddress.text ?? "", startDate: tfStartYear.text ?? "", birthday: tfBirthday.text ?? ""))
        
        print("\(v) - \(nhanVienUtils.nhanVienList.count)")
    }
    
    @IBAction func actEdit(_ sender: Any) {
        let v = nhanVienUtils.suaNhanVien(nhanVien: NhanVien(id: tfID.text ?? "",name: tfName.text ?? "", loai: tfJob.text ?? "", sex: tfSex.text ?? "", address: tfAddress.text ?? "", startDate: tfStartYear.text ?? "", birthday: tfBirthday.text ?? ""))
        
        print("\(v)")
    }

    var keySearch:String = ""
    var valueSearch = [NhanVien]()

    @IBAction func actSearch(_ sender: Any) {
        if keySearch != tfStartYear.text || valueSearch.count == 0{
            valueSearch = nhanVienUtils.timNhanVienByStartYear(year: tfStartYear.text ?? "")
        }
        keySearch = tfStartYear.text ?? ""
        
        if valueSearch.count > 0{
            let v = valueSearch[valueSearch.count-1]
            
            tfJob.text = v.Loai
            tfName.text = v.Name
            tfStartYear.text = v.StartDate
            tfSex.text = v.Sex
            tfAddress.text = v.Address
            tfBirthday.text = v.Birthday
            tfID.text = v.ID
            
            valueSearch.remove(at: valueSearch.count-1)
        }else{
            tfJob.text = nil
            tfName.text = nil
            tfStartYear.text = nil
            tfSex.text = nil
            tfAddress.text = nil
            tfBirthday.text = nil
            tfID.text = nil
            print("Không tìm thấy")
        }
        
    }
    
}
