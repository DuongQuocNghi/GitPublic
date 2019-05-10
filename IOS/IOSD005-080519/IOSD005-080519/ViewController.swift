//
//  ViewController.swift
//  IOSD005-080519
//
//  Created by ADMIN on 5/8/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfB: UITextField!
    @IBOutlet weak var tfC: UITextField!
    @IBOutlet weak var tfKetQua: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionTinh(_ sender: Any) {
        tfA.backgroundColor = UIColor.white
        tfB.backgroundColor = UIColor.white
        tfC.backgroundColor = UIColor.white
        
        guard let A = Float(tfA.text!) else{
            tfA.backgroundColor = UIColor.red
            return
        }
        
        guard let B = Float(tfB.text!) else{
            tfB.backgroundColor = UIColor.red
            return
        }
        
        guard let C = Float(tfC.text!) else{
            tfC.backgroundColor = UIColor.red
            return
        }
        
        guard let kq = GiaiPT(a: A, b: B, c: C) else{
            tfKetQua.text = "Lỗi"
            return
        }
        
        switch kq.status.self {
        case .VoNghiem:
            tfKetQua.text = "Phương trình vô nghiệm"
            break
        case .NghiemKep:
            tfKetQua.text = "x1 = x2 \(String(format: "%.2f", kq.value1!))"
            break
        case .HaiNghiem:
            tfKetQua.text = "x1= \(String(format: "%.2f", kq.value1!))  ,  x2= \(String(format: "%.2f", kq.value2!))"
            break
        }
    }
    
    func GiaiPT(a:Float, b:Float, c:Float) -> KetQuaPT?{
        var r:KetQuaPT?
        
        if a == 0 {
            return KetQuaPT(status: .VoNghiem)
        }
        
        let detal = TinhDetal(a,b,c)
        
        if detal < 0 {
            r = KetQuaPT(status: .VoNghiem)
        } else if detal == 0 {
            let x = Double(-b/2*a)
            r = KetQuaPT(v1: x, v2: x, status: .NghiemKep)
        } else {
            let x1 = Double((-b+sqrt(detal))/2*a)
            let x2 = Double((-b-sqrt(detal))/2*a)
            r = KetQuaPT(v1: x1, v2: x2, status: .HaiNghiem)
        }
        
        return r
    }
    
    func TinhDetal(_ a:Float,_ b:Float,_ c:Float) -> Float {
        return b*b - 4*a*c
    }
}

class KetQuaPT {
    
    let value1:Double?
    let value2:Double?
    let status:StatusKQ
    
    init (v1: Double? = nil, v2: Double? = nil, status:StatusKQ)  {
        self.value1 = v1
        self.value2 = v2
        self.status = status
    }
    
    enum StatusKQ {
        case VoNghiem
        case HaiNghiem
        case NghiemKep
    }

}
