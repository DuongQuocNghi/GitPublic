//
//  ExercisesViewController.swift
//  AppJEFIT
//
//  Created by ADMIN on 6/28/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ExercisesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nhomCoList!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var x = nhomCoList![indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NhomCoViewCell", for: indexPath) as! NhomCoViewCell
        
        cell.Hinh.image = UIImage(named: x.hinh ?? "bp_f_back")
        
        return cell
    }

    var nhomCoUtils : NhomCoUtils?
    var nhomCoList : [NhomCo]?

    override func viewDidLoad() {
        super.viewDidLoad()

        nhomCoUtils = NhomCoUtils(context: (UIApplication.shared.delegate as! AppDelegate).persistentContraner.viewContext)
        
        nhomCoList = nhomCoUtils?.getAll()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
