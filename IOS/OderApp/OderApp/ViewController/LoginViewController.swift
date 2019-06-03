//
//  LoginViewController.swift
//  OderApp
//
//  Created by ADMIN on 5/24/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actLogin(_ sender: Any) {
//        if let viewHome = self.storyboard?.instantiateViewController(withIdentifier: "Home") as? HomeViewController {
//            present(viewHome, animated: true, completion: nil)
//        }
        if let viewHome = self.storyboard?.instantiateViewController(withIdentifier: "TabHome") {
            present(viewHome, animated: true, completion: nil)
        }
    }

}
