//
//  ViewController.swift
//  UseWhile
//
//  Created by ADMIN on 4/10/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var output: UITextView!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onClick_Button(_ sender: Any) {
        if(input.text == ""){
            return
        }
        
        let num = Int(input.text!)
        
        guard let _num = num else{
            output.text = "Giá trị không hợp lệ!"
            input.backgroundColor = UIColor.red
            return
        }
        
        if(_num < 1){
            return
        }
        
        output.text = nil
        
//        UseWhilePrintDate(num:_num)
//        UseWhilePrintNumber(num:_num)
        ParserTimeFromSecondary(secondary:_num)
        
        input.text = nil
    }
    
    func  ParserTimeFromSecondary(secondary s:Int!) {
        let seDay = 86400
        let seHour = 3600
        let seMinute = 60
        
        var secondary:Int! = s
        
        let day = secondary/seDay
        secondary = secondary%seDay
        
        let hourd = secondary/seHour
        secondary = secondary%seHour
        
        let minute = secondary/seMinute
        secondary = secondary%seMinute
        
        if(day != 0){
            output.text = "\(s!) giây \n= \(day) ngày \(hourd) giờ \(minute) phút \(secondary!) giây"
        }else if(hourd != 0){
            output.text = "\(s!) giây \n= \(hourd) giờ \(minute) phút \(secondary!) giây"
        }else if(minute != 0){
            output.text = "\(s!) giây \n= \(minute) phút \(secondary!) giây"
        }else {
            output.text = "\(s!) giây"
        }
    }
    
    func  GetTimeNow(formate f:String) -> String{
        let d = Date();
        let df = DateFormatter();
        df.dateFormat = f;
        return df.string(from: d)
    }
    
    func  UseWhilePrintDate(num:Int!) {
        var str = ""
        var i = 0;
        
        output.text = "Đang xử lý..."
        
        while i < num{
            str += GetTimeNow(formate:"hh:MM:ss \n")
            i += 1;
        }
        
        output.text = str
    }
    
    func  UseWhilePrintNumber(num:Int!) {
        var i = 1;
        var str = ""
        
        output.text = "Đang xử lý..."
        
        while i <= num{
            
            if(i%2==0){
                str += " [\(i)] "
            }
            
            i += 1;
        }
        
        output.text = str
    }
}

