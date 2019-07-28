//
//  DemSoUtils.swift
//  IOSD005-240719
//
//  Created by ADMIN on 7/26/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

protocol DemSoDelegate {
    func soDangDem(so:Int)
}

class DemSoUtils {
    var delegate : DemSoDelegate?
    
    init(dele: DemSoDelegate) {
        self.delegate = dele
    }
    
    func PrintPibonasi(_ v: Int) {
        DispatchQueue.global().async  {
            var r = 0
            for i in 0...v {
                self.delegate?.soDangDem(so: i)
//                self.formatTextPi = "Các giá trị Fibonacci là \(r+i)"
//                self.updateTextLabel()
                sleep(1)
                
            }
        }
    }
}
