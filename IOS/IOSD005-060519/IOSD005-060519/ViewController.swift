//
//  ViewController.swift
//  IOSD005-060519
//
//  Created by ADMIN on 5/6/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let supplies = [
        ["no":"1", "name":"Egg"],
        ["no":"2", "name":"ABC"],
        ["no":"3", "name":"nghi"],
        ["no":"4", "name":"hai"],
        ["no":"5", "name":"hung"],
        ["no":"6", "name":"cuong"],
        ["no":"7", "name":"hoa"],
        ["no":"8", "name":"lan"],
        ["no":"9", "name":"nguyen"],
        ["no":"10", "name":"thanh"],
        ["no":"11", "name":"chi"],
        ["no":"12", "name":"nhan"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supplies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "SupplieViewCellTableViewCell") as? SupplieViewCellTableViewCell
        let supplie = supplies[indexPath.row]
        
        let no = supplie["no"]
        let name = supplie["name"]
        
        cell?.noLabel.text = no
        cell?.nameLabel.text = name
        
        return cell!
    }

}

