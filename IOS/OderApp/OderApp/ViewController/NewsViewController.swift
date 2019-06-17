//
//  NemsViewController.swift
//  OderApp
//
//  Created by ADMIN on 6/12/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var dataSource = [DataModelNewsViewController]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let value = dataSource[indexPath.row]
        var cell : UICollectionViewCell?
        
//        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemFunction", for: indexPath)
        
        switch value.DataType {
        case .Function:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemFunction", for: indexPath)
            break;
        case .Title:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemTitle", for: indexPath)
            break;
        case .Propose:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemPropose", for: indexPath)

            break;
        case .News:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemNews", for: indexPath)

            break;
        }
       
//        cell?.Hinh?.image = UIImage(named: value.Hinh!)
//        cell?.Name.text = value.Ten
//        cell?.Size.text = "nhỏ"
//        cell?.Gia.text = String(value.GiaTien!)
        

        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource.append(DataModelNewsViewController(.Function))
        dataSource.append(DataModelNewsViewController(.Function))
        dataSource.append(DataModelNewsViewController(.Function))

        dataSource.append(DataModelNewsViewController(.Title))
        dataSource.append(DataModelNewsViewController(.Propose))

        dataSource.append(DataModelNewsViewController(.Title))
        dataSource.append(DataModelNewsViewController(.News))
        dataSource.append(DataModelNewsViewController(.News))
        dataSource.append(DataModelNewsViewController(.News))
        dataSource.append(DataModelNewsViewController(.News))
        dataSource.append(DataModelNewsViewController(.News))
        dataSource.append(DataModelNewsViewController(.News))
        dataSource.append(DataModelNewsViewController(.News))
        dataSource.append(DataModelNewsViewController(.News))
        dataSource.append(DataModelNewsViewController(.News))
        // Do any additional setup after loading the view.
    }

}

public class DataModelNewsViewController {
    init(_ type:DataModelNewsViewControllerEnum) {
        DataType = type
    }
    
    var DataType:DataModelNewsViewControllerEnum
}

public enum DataModelNewsViewControllerEnum {
    case Function
    case Title
    case Propose
    case News
}
