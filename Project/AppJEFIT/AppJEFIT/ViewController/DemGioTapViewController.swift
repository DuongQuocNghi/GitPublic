//
//  DemGioTapViewController.swift
//  AppJEFIT
//
//  Created by ADMIN on 7/10/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit
import AVFoundation

class DemGioTapViewController: UIViewController {

    var audioPlay : AVAudioPlayer?
    @IBOutlet weak var timerLabel: UILabel!
    var setTimeUtils : SetTimeUtils?
    var setTime : SetTime?
    var timeText : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTimeUtils = SetTimeUtils(context: (UIApplication.shared.delegate as! AppDelegate).persistentContraner.viewContext)
        // Do any additional setup after loading the view.
        
        setTime = setTimeUtils?.getBy(id: 2)
        
        timeText = Int(setTime?.thoiGianTap ?? 0)
    }
    
    @IBAction func startOnClick(_ sender: Any) {
       var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
    }
    
    @objc func fire(){
        timerLabel.text = "\(2)"
    }
    
    
    @IBAction func endOnClick(_ sender: Any) {
    }
    
    func AudioSoundCountdown()  {
        if let file = Bundle.main.path(forResource: "Countdown-timer", ofType: "mp3"){
//        if let file = NSDataAsset(name: "Countdown-timer"){
            do{
                try audioPlay = AVAudioPlayer(contentsOf: URL(fileURLWithPath: file))
//                try audioPlay = AVAudioPlayer(contentsOf: URL(fileURLWithPath: file.data))
                audioPlay?.play()
            }catch let error{
                print("AVAudioPlayer: \(error)")
            }
        }else{
            print("Can't get path file")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
