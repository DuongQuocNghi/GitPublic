//
//  ViewController.swift
//  TheClock
//
//  Created by ADMIN on 4/5/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TimeLable: UILabel!
    @IBOutlet weak var DayOWLable: UILabel!
    @IBOutlet weak var Secondary: UILabel!
    @IBOutlet weak var Day: UILabel!
    
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DayOWLable.text = nil
        Day.text = nil
        TimeLable.text = nil
        Secondary.text = nil
    
    }
    
    @objc func fire(){
        
        let ss = GetTimeNow(formate: "ss")
        
        DayOWLable.text = GetTimeNow(formate: "EEEE")
        Day.text = GetTimeNow(formate: "MMM dd, yyyy")
        if(Int(ss)!%2==0){
            TimeLable.text = GetTimeNow(formate: "HH:mm")
            Secondary.text = " \(ss)"
        }else{
            TimeLable.text = GetTimeNow(formate: "HH mm")
            Secondary.text = ":\(ss)"
        }
    }
    
    func  GetTimeNow(formate f:String) -> String{
        let d = Date();
        let df = DateFormatter();
        df.dateFormat = f;
        return df.string(from: d)
    }
    

}

