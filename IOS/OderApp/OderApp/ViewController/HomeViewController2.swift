//
//  HomeViewController2ViewController.swift
//  OderApp
//
//  Created by ADMIN on 5/29/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class HomeViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var sanPhamUtils = SanPhamUtils()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sanPhamUtils.dumpData()

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sp = sanPhamUtils.sanPhamThucAnList[indexPath.row]
        var chiTiet = storyboard?.instantiateViewController(withIdentifier: "ChiTietSP") as? ChiTietSanPhamViewController
        chiTiet?.Data = sp
        chiTiet?.modalPresentationStyle = .custom
        present(chiTiet!, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SanPhamItem") as? SanPhamTableViewCell
        
        let value = sanPhamUtils.sanPhamThucAnList[indexPath.row]
        
        cell?.Hinh?.image = UIImage(named: value.Hinh!)
        cell?.DatTruoc?.isHidden = value.ThucAnNhanh!
        cell?.Ten?.text = value.Ten
        cell?.Gia?.text = String(value.GiaTien!)
        cell?.Mota?.text = value.Mota
        
        return cell!
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sanPhamUtils.sanPhamThucAnList.count
    }


}
