//
//  ViewController.swift
//  IOSD005-150419
//
//  Created by ADMIN on 4/15/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    typealias sumCLs = (Int,Int)->(Int)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let simpleClosure = {
            print("hello nghi!")
            print("sao lễ mà học vậy")
        }
        
        
        func simpleFunc() {
            print("khổ lắm")
        }
        
        let simClosure:()->() = {
            print("hi hi")
        }

        let simClosureName:(String)->() = { name in
            print("sao \(name) lại cười")
        }
        
        let simClosureName2:(Bool,String,String)->(String) = { value, name1, name2 in
            if value{
                return name1
            }else{
                return name2
            }
        }
        
        let sumAndMin:(Int,Int)->(Int,Int) = { value1,value2 in
            return (value1+value2,value1-value2)
            
        }
        
        let sum :sumCLs={
            v1 , v2 in
            return v1 + v2
        }
        
        simpleClosure()
        simpleFunc()
//        self.simpleFunc()
        simClosure()
        simClosureName("Nghi")
        print(simClosureName2(true,"nghi","lan"))
        print(sumAndMin(2,4))
        print(sumAndMin(2,4).0)
        print(sumAndMin(2,4).1)
        print(sum(4,6))
        
        let handler:ValidateNum = {(message) in
            print(message)
        }
        
        checkNum(str: "ac", handler: handler)
        
        checkNum(str: "5") { (message) in
            print(message)
        }
        
        
        self.simpleFunc()
//        self.simpleFunc { (Int) -> (String) in
//
//        }
//        self.simpleFunc((v: 1980))
        
        let ha:(Int) -> (Int) = { v in
            return v*10
        }
        
        print(tinh(3, handler: ha))
        
        print(tinh(5) { (m) -> (Int) in
            return m*100
        })
    }
    
    typealias ValidateNum = (String)->()
    func checkNum(str:String?,handler:ValidateNum ){
        if str == nil{
            handler("Bạn nhập sai rồi")
        }else{
            
        }
    }
    
//    func simpleFunc() {
//        print("giỗ tổ hùng vương")
//    }

//    func simpleFunc(_ v:Int = 1980) {
//        print(String(v))
//    }
    
    func simpleFunc(a:(Int)->(String) = {value in return "ha ha \(value)"}) {
        print(a(5))
    }

    func tinh(_ v:Int,handler:(Int)->(Int)) -> String {
        return "Kết quả của phép tính là :\(handler(v))"
    }
    
}


