//
//  CongViecViewController.swift
//  BTIOS-100519
//
//  Created by ADMIN on 5/20/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class CongViecViewController: UIViewController {

    @IBOutlet weak var lbNhanVien: UILabel!
    @IBOutlet weak var tfPhongBan: UITextField!
    @IBOutlet weak var tfChucVu: UITextField!
    @IBOutlet weak var tfCongViec: UITextField!
    
    var thongTinNhanVien:NhanVien?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lbNhanVien.text = "Nhân viên: \((thongTinNhanVien?.Name)!)"
        tfPhongBan.text = thongTinNhanVien?.CongViec?.PhongBan
        tfChucVu.text = thongTinNhanVien?.CongViec?.ChucVu
        tfCongViec.text = thongTinNhanVien?.CongViec?.CongViec
    }
    
    @IBAction func actPhanCong(_ sender: Any) {
        thongTinNhanVien?.CongViec = NhanVien.PhanCong(phongBan: tfPhongBan.text ?? "",chucVu: tfChucVu.text ?? "",congViec: tfCongViec.text ?? "")
    }
    
}
