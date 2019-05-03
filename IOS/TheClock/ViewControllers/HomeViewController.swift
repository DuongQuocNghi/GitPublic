//
//  ViewController.swift
//  TheClock
//
//  Created by ADMIN on 4/5/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    @IBOutlet weak var TimeLable: UILabel!
    @IBOutlet weak var DayOWLable: UILabel!
    @IBOutlet weak var Secondary: UILabel!
    @IBOutlet weak var Day: UILabel!
    
    var btnTimer: UIButton!
    var btnSettings: UIButton!
    var btnThemes: UIButton!
    var btnNotification: UIButton!
    var lableNotification: UILabel!

    var didSetupConstraints = false
    
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
    
        setUpUI()
    }
    
    func setUpUI() {
        btnTimer = UIButton()
        btnTimer.translatesAutoresizingMaskIntoConstraints = false
        btnTimer.setImage(UIImage(named: "ic_timer"), for: .normal)
        btnTimer.addTarget(self, action: #selector(self.onClickBtnTimer(_:)), for: .touchUpInside)
        view.addSubview(btnTimer)
        
        btnSettings = UIButton()
        btnSettings.translatesAutoresizingMaskIntoConstraints = false
        btnSettings.setImage(UIImage(named: "ic_settings"), for: .normal)
        btnSettings.addTarget(self, action: #selector(self.onClickBtnSettings(_:)), for: .touchUpInside)
        view.addSubview(btnSettings)
        
        btnThemes = UIButton()
        btnThemes.translatesAutoresizingMaskIntoConstraints = false
        btnThemes.setImage(UIImage(named: "ic_themes"), for: .normal)
        btnThemes.addTarget(self, action: #selector(self.onClickBtnThemes(_:)), for: .touchUpInside)
        view.addSubview(btnThemes)
        
        btnNotification = UIButton()
        btnNotification.translatesAutoresizingMaskIntoConstraints = false
        btnNotification.setImage(UIImage(named: "ic_notification"), for: .normal)
        btnNotification.addTarget(self, action: #selector(self.onClickBtnNotification(_:)), for: .touchUpInside)
        view.addSubview(btnNotification)
        
        lableNotification = UILabel()
        lableNotification.translatesAutoresizingMaskIntoConstraints = false
        lableNotification.text = "OFF"
        lableNotification.textColor = UIColor(red: 59/255, green: 215/255, blue: 43/255, alpha: 1)
        view.addSubview(lableNotification)
        
    }
    
    override func updateViewConstraints() {
        if(!didSetupConstraints){
            btnTimer.snp.makeConstraints { (make) in
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20.0)
                make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(5.0)
            }
            
            btnSettings.snp.makeConstraints { (make) in
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20.0)
                make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(5.0)
            }
            
            btnThemes.snp.makeConstraints { (make) in
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20.0)
                make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(5.0)
            }
            
            btnNotification.snp.makeConstraints { (make) in
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20.0)
                make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(5.0)
            }
            
            lableNotification.snp.makeConstraints { (make) in
                make.height.equalTo(btnNotification.snp.height)
                make.centerY.equalTo(btnNotification.snp.centerY).inset(20.0)
                make.leading.equalTo(btnNotification.snp.trailing).inset(-5)
            }
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
    func  GetTimeNow(formate f:String) -> String{
        let d = Date();
        let df = DateFormatter();
        df.dateFormat = f;
        return df.string(from: d)
    }
    
    @IBAction func onClickBtnTimer(_ sender: Any){

    }
    
    @IBAction func onClickBtnSettings(_ sender: Any){
        
    }
    
    @IBAction func onClickBtnThemes(_ sender: Any){
        
    }
    
    @IBAction func onClickBtnNotification(_ sender: Any){
        if(lableNotification.text == "OFF") {
            lableNotification.text = "ON"
        }else{
            lableNotification.text = "OFF"
        }
    }
    
    @objc func fire(){
        
        let ss = GetTimeNow(formate: "ss")
        
        DayOWLable.text = GetTimeNow(formate: "EEEE")
        Day.text = GetTimeNow(formate: "MMM dd, yyyy")
//        if(Int(ss)!%2==0){
            TimeLable.text = GetTimeNow(formate: "HH:mm")
//            Secondary.text = " \(ss)"
//        }else{
//            TimeLable.text = GetTimeNow(formate: "HH mm")
            Secondary.text = ":\(ss)"
//        }
    }
    

}

