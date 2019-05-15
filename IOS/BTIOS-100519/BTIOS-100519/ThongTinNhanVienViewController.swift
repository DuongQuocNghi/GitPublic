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
    
    var nhanVienList = [NhanVien]()
    
    @IBAction func actDelete(_ sender: Any) {
        
    }   
    
    @IBAction func actAdd(_ sender: Any) {
        nhanVienList.append(NhanVien(id: String(nhanVienList.count),name: tfName.text ?? "", loai: tfJob.text ?? "", sex: tfSex.text ?? "", address: tfAddress.text ?? "", startDate: tfStartYear.text ?? "", birthday: tfBirthday.text ?? ""))
        
        print(nhanVienList.count)
    }
    
    @IBAction func actEdit(_ sender: Any) {
        
    }
    
    @IBAction func actSearch(_ sender: Any) {
    }
    
}
