//
//  HomeViewController.swift
//  OderApp
//
//  Created by ADMIN on 5/24/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var sanPhamUtils = SanPhamUtils()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sanPhamUtils.sanPhamNuocList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SanPhamItem") as? SanPhamTableViewCell
        
        let value = sanPhamUtils.sanPhamNuocList[indexPath.row]
        
//        cell?.Hinh?.image = UIImage()
        cell?.Ten?.text = value.Ten
        cell?.Gia?.text = String(value.GiaTien!)
        cell?.Mota?.text = value.Mota

        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sanPhamUtils.dumpData()
        
    }
    
    @IBAction func actLogout(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
