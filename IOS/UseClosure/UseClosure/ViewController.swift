//
//  ViewController.swift
//  UseClosure
//
//  Created by ADMIN on 4/17/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMin: UIButton!
    @IBOutlet weak var btnMul: UIButton!
    @IBOutlet weak var btnDiv: UIButton!
    
    var keyAction:KeyAction
    var result:Int!
    
    typealias HandlerAction = (Int,Int)->(String)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onChangeValue(_ sender: Any) {
        refeshAllFieldState()
    }
    @IBAction func onClickBtnDiv(_ sender: Any) {
        setColorBtnClicked(btnDiv:UIColor.green)
        showResult()
        keyAction = KeyAction.Div
    }
    @IBAction func onClickBtnMul(_ sender: Any) {
        setColorBtnClicked(btnMul:UIColor.green)
        showResult()
        keyAction = KeyAction.Mul
    }
    @IBAction func onClickBtnMin(_ sender: Any) {
        setColorBtnClicked(btnMin:UIColor.green)
        showResult()
        keyAction = KeyAction.Min
    }
    @IBAction func onClickBtnPlus(_ sender: Any) {
        setColorBtnClicked(btnPlus:UIColor.green)
        showResult()
        keyAction = KeyAction.Plus
    }
    @IBAction func onClickButtonAC(_ sender: Any) {
        clearAllValue()
    }
    @IBAction func onClickButtonC(_ sender: Any) {
        clearInputValue()
    }
    @IBAction func onClickButtonResult(_ sender: Any) {
    }
    
    func clearInputValue() {
        input.text = ""
    }
    
    func clearAllValue() {
        clearInputValue()
        output.text = ""
        keyAction = KeyAction.None
        refeshAllFieldState()
    }
    
    func setColorBtnClicked(btnPlus:UIColor = UIColor.white,btnMin:UIColor = UIColor.white,btnMul:UIColor = UIColor.white,btnDiv:UIColor = UIColor.white) {
        self.btnPlus.backgroundColor = btnPlus
        self.btnMin.backgroundColor = btnMin
        self.btnMul.backgroundColor = btnMul
        self.btnDiv.backgroundColor = btnDiv
    }
    
    func showFieldError(field:UIView) {
        field.backgroundColor = UIColor.red
    }
    
    func refeshAllFieldState() {
        input.backgroundColor = UIColor.white
    }
    
    func showResult() {
        
        let actPlus:HandlerAction = { (n1 , n2) in
            return String(n1/n2)
        }
        
        let actMin:HandlerAction = { (n1 , n2) in
            return String(n1-n2)
        }
        
        let actMul:HandlerAction = { (n1 , n2) in
            return String(n1*n2)
        }
        
        let actDiv:HandlerAction = { (n1 , n2) in
            return String(n1/n2)
        }
        
        switch keyAction {
        case .Plus:
            calculate(handler: actPlus)
        case .Min:
            calculate(handler: actPlus)
        case .Mul:
            calculate(handler: actPlus)
        case .Div:
            calculate(handler: actPlus)
        default:
            <#code#>
        }
        
        
    }
    
    func calculate(handler:HandlerAction) {
        if(input.text == ""){
            return
        }
        
        let value = Int(input.text!)
        
        guard let num = value else {
            showFieldError(field:input)
            return
        }
        
        guard let _ = result else {
            result = value
            output.text = String(result)
            return
        }
        
        output.text = handler(result,num)
        
    }
}

enum KeyAction{
    case None
    case Plus
    case Min
    case Mul
    case Div
}
