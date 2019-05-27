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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        CreateDataSample();
    }
    
    @IBAction func backFromPhanCongPageChange(segue: UIStoryboardSegue) {
        if let view = segue.source as? CongViecViewController {
//            if let nv = nhanVienUtils.timNhanVienByID(id: (view.thongTinNhanVien?.ID)!) {
//                nv.CongViec = view.thongTinNhanVien?.CongViec
//            }
            nhanVienUtils.suaNhanVien(nhanVien: view.thongTinNhanVien!)
        }
    }
    
    @IBAction func backFromPhanCongPage(segue: UIStoryboardSegue) {
        print("not change")
    }
    
    func CreateDataSample() {
        
        var nv1 = NhanVien(id: "1", name: "Nghi", loai: "0", sex: "1", address: "HCM", startDate: "2018", birthday: "1998")
        nv1.CongViec = NhanVien.PhanCong(phongBan: "Mobile", chucVu: "Deverloper", congViec: "Dev mobile")
        
        nhanVienUtils.themNhanVien(nhanVien: nv1)
        
        nhanVienUtils.themNhanVien(nhanVien: NhanVien(id: "2", name: "Lan", loai: "0", sex: "1", address: "HCM", startDate: "2018", birthday: "1996"))
        
        nhanVienUtils.themNhanVien(nhanVien: NhanVien(id: "3", name: "Ha", loai: "1", sex: "0", address: "Ca Mau", startDate: "2000", birthday: "1988"))
        
        nhanVienUtils.themNhanVien(nhanVien: NhanVien(id: "4", name: "Tien", loai: "2", sex: "1", address: "Ha Noi", startDate: "2019", birthday: "2000"))
        
        nhanVienUtils.themNhanVien(nhanVien: NhanVien(id: "5", name: "Tu", loai: "0", sex: "1", address: "Nha Trang", startDate: "1999", birthday: "1932"))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tinhLuong"{
            print("tinhLuong")
            if let manhinhLuong = segue.destination as? ViewController {
                if let nv = nhanVienUtils.timNhanVienByID(id: tfID.text ?? ""){
                    manhinhLuong.thongTinNhanVien = nv
                }
            }
        }else if segue.identifier == "congViec" {
            print("congViec")
            if let manhinhLuong = segue.destination as? CongViecViewController {
                if let nv = nhanVienUtils.timNhanVienByID(id: tfID.text ?? ""){
                    manhinhLuong.thongTinNhanVien = nv
                }
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
