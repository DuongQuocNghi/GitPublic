//
//  HomeViewController3.swift
//  OderApp
//
//  Created by ADMIN on 6/10/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class HomeViewController3: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var sanPhamUtils = SanPhamUtils()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sanPhamUtils.sanPhamList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemSanPham", for: indexPath) as? ItemSanPhamCollectionViewCell
        
        let value = sanPhamUtils.sanPhamList[indexPath.row]
        
        cell?.Hinh?.image = UIImage(named: value.Hinh!)
        cell?.Name.text = value.Ten
        cell?.Size.text = "nhỏ"
        cell?.Gia.text = String(value.GiaTien!)
        
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        sanPhamUtils.dumpData()
        // Do any additional setup after loading the view.
    }
    

}
