//
//  ViewController.swift
//  IOSBT080419
//
//  Created by ADMIN on 4/8/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var output: UILabel!
    
    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var buttonNumInt: UIButton!
    @IBOutlet weak var buttonYear: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    
    var totalNum:Float! = nil;
    var typeKey:Int! = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onClick_ButtonNumInt(_ sender: Any) {
        input.backgroundColor = UIColor.white
        
        let num = Float(input.text!)
        
        guard let _num = num else{
            output.text = "Giá trị không hợp lệ!"
            input.backgroundColor = UIColor.red
            return
        }
        
        if(_num == Float(Int(_num))){
            output.text = "\(input.text!) là giá trị nguyên"
        }else{
            output.text = "\(input.text!) là giá không trị nguyên"
        }
        
    }
    
    @IBAction func onClick_ButtonYear(_ sender: Any) {
        input.backgroundColor = UIColor.white
        
        let num = Int(input.text!)
        
        guard let _num = num else{
            output.text = "Giá trị không hợp lệ!"
            input.backgroundColor = UIColor.red
            return
        }
        
        if((_num % 4 == 0 && _num % 100 != 0)||(_num % 400 == 0) ){
            output.text = "\(input.text!) là năm nhuận"
        }else{
            output.text = "\(input.text!) là năm không nhuận"
        }
        
    }
    
    
    @IBAction func onClick_ButtonAC(_ sender: Any) {
        output.text = nil
        input.text = nil
        totalNum = nil
        typeKey = nil
        buttonPlus.backgroundColor = UIColor.groupTableViewBackground
        buttonMinus.backgroundColor = UIColor.groupTableViewBackground
        buttonMultiply.backgroundColor = UIColor.groupTableViewBackground
        buttonDivide.backgroundColor = UIColor.groupTableViewBackground

    }
    
    @IBAction func onClick_ButtonC(_ sender: Any) {
        input.text = nil
    }
    
    @IBAction func onClick_ButtonPlus(_ sender: Any) {
        Calculator(type: typeKey)
        typeKey = 0
        buttonPlus.backgroundColor = UIColor.lightGray
        buttonMinus.backgroundColor = UIColor.groupTableViewBackground
        buttonMultiply.backgroundColor = UIColor.groupTableViewBackground
        buttonDivide.backgroundColor = UIColor.groupTableViewBackground
        
    }
    
    @IBAction func onClick_ButtonMinus(_ sender: Any) {
        Calculator(type: typeKey)
        typeKey = 1
        buttonPlus.backgroundColor = UIColor.groupTableViewBackground
        buttonMinus.backgroundColor = UIColor.lightGray
        buttonMultiply.backgroundColor = UIColor.groupTableViewBackground
        buttonDivide.backgroundColor = UIColor.groupTableViewBackground
    }
    
    @IBAction func onClick_ButtonMultiply(_ sender: Any) {
        Calculator(type: typeKey)
        typeKey = 2
        buttonPlus.backgroundColor = UIColor.groupTableViewBackground
        buttonMinus.backgroundColor = UIColor.groupTableViewBackground
        buttonMultiply.backgroundColor = UIColor.lightGray
        buttonDivide.backgroundColor = UIColor.groupTableViewBackground
    }
    
    @IBAction func onClick_ButtonDivide(_ sender: Any) {
        Calculator(type: typeKey)
        typeKey = 3
        buttonPlus.backgroundColor = UIColor.groupTableViewBackground
        buttonMinus.backgroundColor = UIColor.groupTableViewBackground
        buttonMultiply.backgroundColor = UIColor.groupTableViewBackground
        buttonDivide.backgroundColor = UIColor.lightGray
    }

    @IBAction func onClick_ButotnCalculation(_ sender: Any) {
        Calculator(type: typeKey)
        typeKey = nil
        buttonPlus.backgroundColor = UIColor.groupTableViewBackground
        buttonMinus.backgroundColor = UIColor.groupTableViewBackground
        buttonMultiply.backgroundColor = UIColor.groupTableViewBackground
        buttonDivide.backgroundColor = UIColor.groupTableViewBackground

    }
    
    func Calculator(type t:Int?) {
        typeKey = t
        if(input.text == ""){
            return
        }
        
        input.backgroundColor = UIColor.white
        
        let num = Float(input.text!)
        
        guard let _num = num else{
            output.text = "Giá trị không hợp lệ!"
            input.backgroundColor = UIColor.red
            return
        }
        
        let tampNum = totalNum
        
        if(typeKey == nil || totalNum == nil){
            
            totalNum = _num
            output.text = "\(input.text!)"
            
        }else{
            var tam  = ""
            
            switch(t){
            case 0: // "+"
                tam = "+"
                totalNum += _num
                break
            case 1: // "-"
                tam = "-"
                totalNum -= _num
                break
            case 2: // "x"
                tam = "x"
                totalNum *= _num
                break
            case 3: // "/"
                tam = "/"
                totalNum /= _num
                break
            default:
                return
            }
            
            output.text = "\(tampNum!) \(tam) \(input.text!) = \(totalNum!)"
            
            if(totalNum.isInfinite){
                totalNum = nil
            }
        }
        
        input.text = nil
    }
    
}

