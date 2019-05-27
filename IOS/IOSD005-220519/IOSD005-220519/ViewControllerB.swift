//
//  ViewControllerB.swift
//  IOSD005-220519
//
//  Created by ADMIN on 5/22/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

protocol PhepTinhDelegate {
    func PhepCong(ketQua: String)
    func PhepNhan(ketQua: String) -> String
}

class ViewControllerB: UIViewController {

    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfB: UITextField!
    
    var phepTinhCallBack:PhepTinhDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actKetQua(_ sender: Any) {
//        let kq = "\(tfA.text!) + \(tfB.text!)"
//        phepTinhCallBack?.PhepCong(ketQua: kq)
//        dismiss(animated: true, completion: nil)
       tfA.text = phepTinhCallBack?.PhepNhan(ketQua: "\(tfA.text!) + \(tfB.text!)")
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
