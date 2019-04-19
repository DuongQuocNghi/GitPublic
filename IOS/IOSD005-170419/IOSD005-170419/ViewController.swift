//
//  ViewController.swift
//  IOSD005-170419
//
//  Created by ADMIN on 4/17/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dict: [String:Int] = [:]
    var newValueDict = ["A":1,"B":2,"C":3]
    var dictAny: [String:Any] = ["A":1,"B":2,"C":"3","D":"4"]
    var dictAny2: Dictionary<String,Any> = ["A":1,"B":2,"C":"3","D":"4"]
    
    var array : [Int] = []
    var array2 : Array<Int> = [1,2,4,5,6,7,8,9]
    var array3 = [Int]()
    var array4 = [[String:Any]]()
    var array5 : [[Int]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        print(dict)
//        print("---")
//        print(newValueDict)
//        print("---")
        
        print(dictAny["B"]!)
        dictAny["B"] = 10
        print(dictAny["B"]!)
        
        var abc : [Int] = [1,2,3]
        
        for(key,value) in dictAny{
            print(key)
            print(value)
        }
        
        for (model) in dictAny{
            print(model)
        }
        
        array.append(2)
        
    }


}

