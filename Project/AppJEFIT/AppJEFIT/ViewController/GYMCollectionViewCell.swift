//
//  GYMCollectionViewCell.swift
//  AppJEFIT
//
//  Created by ADMIN on 7/3/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class GYMCollectionViewCell: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return phongTapList!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var x = phongTapList?[indexPath.row]
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhongTapViewCell", for: indexPath) as! PhongTapViewCell
        
        cell.Hinh.image = UIImage(named: (x?.hinh)!)
        cell.Ten.text = x?.ten
        cell.DanhGia.text = String((x?.danhGia)!)
        cell.DiaChi.text = x?.diaChi
        cell.ThoiGia.text = x?.gioMoCua
        
        return cell
    }
    
    var phongTapUtils : PhongTapUtils?
    var phongTapList : [PhongTap]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phongTapUtils = PhongTapUtils(context: (UIApplication.shared.delegate as! AppDelegate).persistentContraner.viewContext)
        
        phongTapList = phongTapUtils?.getAll()
    }
    
}
