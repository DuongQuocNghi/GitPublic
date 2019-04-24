//
//  ViewController.swift
//  IOSD005-220419
//
//  Created by ADMIN on 4/22/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var borderInput: UIView!
    
    override func viewDidLayoutSubviews() {
        setUpView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setUpView() {
        logo.layer.cornerRadius = 5
        loginBtn.layer.cornerRadius = 5
        
        createBtn.layer.cornerRadius = 5
        createBtn.layer.borderWidth = 1
        createBtn.layer.borderColor = UIColor.init(red: 102/255, green: 140/255, blue: 190/255, alpha: 1).cgColor
        
        borderInput.layer.cornerRadius = 5
        borderInput.layer.borderWidth = 1
        borderInput.layer.borderColor = UIColor.init(red: 218/255, green: 219/255, blue: 220/255, alpha: 1).cgColor
        
    }

}

