//
//  ChiTietBaiTapViewController.swift
//  AppJEFIT
//
//  Created by ADMIN on 7/22/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ChiTietBaiTapViewController: UIViewController {

    @IBOutlet weak var videoView: VideoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        videoView.setURL(url: "https://dl.dropboxusercontent.com/s/huy4jjdg99sybqu/y2mate.com%20-%20blackpink_kill_this_love_mv_2S24-y0Ij3Y_144p.mp4")
        videoView.play()
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
