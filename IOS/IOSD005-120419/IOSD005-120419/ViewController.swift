//
//  ViewController.swift
//  IOSD005-120419
//
//  Created by ADMIN on 4/12/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputN1: UITextField!
    @IBOutlet weak var inputN2: UITextField!
    @IBOutlet weak var inputN3: UITextField!
    @IBOutlet weak var inputN4: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var outputSubtrac: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onValueChangeN1(_ sender: Any) {
        sumN1vN2()
    }
    
    @IBAction func onValueChangeN2(_ sender: Any) {
        sumN1vN2()
    }
    
    @IBAction func onValueChangeN3(_ sender: Any) {
        subtracN1vN2()
    }
    
    @IBAction func onValueChangeN4(_ sender: Any) {
        subtracN1vN2()
    }
    
}

extension ViewController{
    
    func sumN1vN2() {
        inputN1.backgroundColor = UIColor.white
        inputN2.backgroundColor = UIColor.white
        
        if(inputN1.text == "" || inputN2.text == ""){
            output.text = ""
            return
        }
        
        let n1 = Int(inputN1.text!)
        let n2 = Int(inputN2.text!)
        
        guard let num1 = n1 else{
            inputN1.backgroundColor = UIColor.red
            return
        }
        
        guard let num2 = n2 else{
            inputN2.backgroundColor = UIColor.red
            return
        }
        
        
        output.text = sum(n1: num1, n2: num2)
    }
    
    func sum(n1:Int! , n2:Int!) -> String {
        return String(n1+n2)
    }
    
    func subtracN1vN2() {
        inputN3.backgroundColor = UIColor.white
        inputN4.backgroundColor = UIColor.white
        
        if(inputN3.text == "" || inputN4.text == ""){
            outputSubtrac.text = ""
            return
        }
        
        let n3 = Int(inputN3.text!)
        let n4 = Int(inputN4.text!)
        
        guard let num3 = n3 else{
            inputN3.backgroundColor = UIColor.red
            return
        }
        
        guard let num4 = n4 else{
            inputN4.backgroundColor = UIColor.red
            return
        }
        
        outputSubtrac.text = subtrac(n1: num3, n2: num4)
    }
    
    func subtrac(n1:Int! , n2:Int!) -> String {
        return String(n1-n2)
    }
}
