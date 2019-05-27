//
//  ViewController.swift
//  IOSD005-220519
//
//  Created by ADMIN on 5/22/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PhepTinhDelegate {
    
    @IBOutlet weak var lbKQ: UILabel!
    
    func PhepCong(ketQua: String) {
        lbKQ.text = "Phép tính: \(ketQua)"
    }
    
    func PhepNhan(ketQua: String) ->String {
        return "Phép tính: \(ketQua) x2"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let phepCongVC = segue.destination as? ViewControllerB{
            phepCongVC.phepTinhCallBack = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
