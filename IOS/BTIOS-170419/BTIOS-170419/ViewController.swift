//
//  ViewController.swift
//  BTIOS-170419
//
//  Created by ADMIN on 4/19/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bai1()
        
        bai2()
    }

    func bai1() {
        let a =  [1,12,231,15,26,99]
        
        var maxValue = a[0]
        for x in a {
            if(x > maxValue){
                maxValue = x
            }
        }
        print(maxValue)
    }

    func bai2() {
        
        var students = [
            ["name": "Phu","age": 20],
            
            ["name": "Dat","age": 20],
            
            ["name": "Duc","age": 20],
            
            ["name": "Van","age": 20]
        ]
        
        for i in 0..<students.count{
            students[i]["class"] = "iOS-D005"
        }
        
        print(students)

    }

}

