//
//  ViewController.swift
//  BTIOS-100519
//
//  Created by ADMIN on 5/13/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfNamCT: UITextField!
    @IBOutlet weak var tfDoanhT: UITextField!
    @IBOutlet weak var tfPhanTHH: UITextField!
    @IBOutlet weak var tfSanL: UITextField!
    @IBOutlet weak var lbLuong: UILabel!
    @IBOutlet weak var tfHeSL: UITextField!
    @IBOutlet weak var tfLoai: UITextField!
    @IBOutlet weak var lbNamCT: UILabel!
    @IBOutlet weak var lbHeSL: UIView!
    @IBOutlet weak var lbDoanhT: UILabel!
    @IBOutlet weak var lbPhanTHH: UILabel!
    @IBOutlet weak var lbSanL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionTinhLuong(_ sender: Any) {
        var loai:ENhanVien = .None
        
        if(Int(tfLoai.text!) == 0){
            loai = .NVVP
        } else if(Int(tfLoai.text!) == 1){
            loai = .NVKD
        } else if(Int(tfLoai.text!) == 2){
            loai = .CN
        }
        
        lbLuong.text = "Lương: \(TinhLuongUtils().TinhLuong(loaiNV: loai, thamNien: Int(tfNamCT.text!) ?? 0, heSoLuong: Double(tfDoanhT.text!) ?? 0, doanhThu: Double(tfDoanhT.text!) ?? 0, phanTramHoaHong: Double(tfPhanTHH.text!) ?? 0, sanLuong: Int(tfSanL.text!) ?? 0))"
        
    }
    
    @IBAction func actShowViewNVVP(_ sender: Any) {
        showContenctView(viewNamCT:false,viewHeSL:false)
        tfLoai.text = "0"
    }
    @IBAction func actShowViewNVKD(_ sender: Any) {
        showContenctView(viewDoanhT:false,viewPhanTHH:false)
        tfLoai.text = "1"
    }
    @IBAction func actShowViewCN(_ sender: Any) {
        showContenctView(viewHeSL:false,viewSanL:false)
        tfLoai.text = "2"
    }
    
    func showContenctView(viewNamCT:Bool = true, viewHeSL:Bool = true, viewDoanhT:Bool = true, viewPhanTHH:Bool = true, viewSanL:Bool = true) {
        lbNamCT.isHidden = viewNamCT
        tfNamCT.isHidden = viewNamCT
        
        lbHeSL.isHidden = viewHeSL
        tfHeSL.isHidden = viewHeSL
        
        lbDoanhT.isHidden = viewDoanhT
        tfDoanhT.isHidden = viewDoanhT
        
        lbPhanTHH.isHidden = viewPhanTHH
        tfPhanTHH.isHidden = viewPhanTHH
        
        lbSanL.isHidden = viewSanL
        tfSanL.isHidden = viewSanL
    }
    
}

