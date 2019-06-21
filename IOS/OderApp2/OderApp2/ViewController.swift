//
//  ViewController.swift
//  OderApp2
//
//  Created by ADMIN on 6/17/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var mainColletionViewCell: UICollectionView!
    var array = [1,1,1,2,3,1,2,1]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TinTucCollectionViewCell", for: indexPath) as? TinTucCollectionViewCell{
            return cell
        }
        return UICollectionViewCell()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainColletionViewCell.register(UINib.init(nibName: "TinTucCollectionViewCell",bundle: nil), forCellWithReuseIdentifier: "TinTucCollectionViewCell")
    }


}

