//
//  RegisterViewController.swift
//  OderApp
//
//  Created by ADMIN on 5/24/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actRegister(_ sender: Any) {
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "Login") as? LoginViewController {
            present(view, animated: true, completion: nil)
        }
    }
    

}
