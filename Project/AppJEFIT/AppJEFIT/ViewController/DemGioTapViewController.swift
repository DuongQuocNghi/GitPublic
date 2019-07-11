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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startOnClick(_ sender: Any) {
        AudioSoundCountdown()
    }
    
    func AudioSoundCountdown()  {
        if let file = Bundle.main.path(forResource: "Countdown-timer", ofType: "mp3"){
            do{
                try audioPlay = AVAudioPlayer(contentsOf: URL(fileURLWithPath: file))
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
