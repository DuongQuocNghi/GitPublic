//
//  ViewController.swift
//  IOSD005-240719
//
//  Created by ADMIN on 7/24/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DemSoDelegate {
    func soDangDem(so: Int) {
        self.formatTextPi = "Các giá trị Fibonacci là \(1+so)"
        self.updateTextLabel()
    }
    
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var input: UITextField!
    
    var soDem : DemSoUtils?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        soDem = DemSoUtils(dele: self)
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClick(_ sender: Any) {
        
        DispatchQueue.main.async {
            
            let n = Int(self.input.text ?? "-1")
            
            if( n == -1 || n == nil){
                self.updateTextLabel("Giá trị không hợp lệ")
                return
            }
            
            self.PrintSoNT(n!){(x) in
                self.formatTextNT = "Các giá trị nguyên tố là \(x)"
                self.updateTextLabel()
            }
            self.soDem?.PrintPibonasi(n!)
            
//            if(self.checkSoNguyenTo(n!)){
//                self.PrintSoNT(n!)
//            }else{
//                self.updateTextLabel("\(self.input.text!) không phải là số guyên tố")
//            }
        }
        
    }
    
    var formatTextNT = "Các giá trị nguyên tố là 2"
    var formatTextPi = "Các giá trị Fibonacci là 0"
    
    func PrintSoNT(_ v: Int, soDem: @escaping (Int) -> Void) {
        DispatchQueue.global().async {
            for i in 2...v {
                if(self.checkSoNguyenTo(i)){
                    soDem(i)
//                    self.formatTextNT = "Các giá trị nguyên tố là \(i)"
//                    self.updateTextLabel()
//                    updateTextLabel("Các giá trị nguyên tố là\n\(i)");
                    sleep(1)
                }
            }
        }
    }
    
    
    
    func updateTextLabel() {
        DispatchQueue.main.async {
            self.textLabel.text = "\(self.formatTextNT)\n\(self.formatTextPi)"
        }
    }
    
    func updateTextLabel(_ v: String) {
        DispatchQueue.main.async {
            self.textLabel.text = v
        }
    }
    
    
    func checkSoNguyenTo(_ v: Int) -> Bool {
        if(v < 2){
            return false
        }
        
        if(v == 2){
            return true
        }
        
        for i in 2...(v-1) {
            if(v%i==0){
                return false
            }
        }
        return true
    }
}

