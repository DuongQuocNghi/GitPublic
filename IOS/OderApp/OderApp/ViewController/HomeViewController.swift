//
//  HomeViewController.swift
//  OderApp
//
//  Created by ADMIN on 5/24/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let sp = SanPhamModel("Bánh mì", 20000, "Bánh mì Hà Nội", "https://bitly.vn/45bg")
        let spnuoc = SPNuocModel("Cà phê đá", 20000, "Cà phê Sài Gòn Xưa", "https://bitly.vn/45bt",luongDa: 0)

        print(sp.GiaKhuyenMai()!)
        print(spnuoc.GiaKhuyenMai()!)
        print(spnuoc.GiaKhuyenMai(giam: 0.5)!)
    }
    
    @IBAction func actLogout(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
