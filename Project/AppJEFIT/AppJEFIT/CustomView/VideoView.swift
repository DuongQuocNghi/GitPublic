//
//  VideoView.swift
//  AppJEFIT
//
//  Created by ADMIN on 7/15/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoView : UIView {
    var videoPlayer : AVPlayerLayer?
    var avPlayer : AVPlayer?
    var videoURL : String?
    
    func setURL(url : String) {
        // Direct link can play
        // https://dl.dropboxusercontent.com/s/l65jm79el20vqnh/mv.mp4
        if let videoURL = URL(string: url){
            avPlayer = AVPlayer(url: videoURL)
            videoPlayer = AVPlayerLayer(player: avPlayer)
            videoPlayer?.frame = bounds
            videoPlayer?.videoGravity = AVLayerVideoGravity.resizeAspect
            
            if let customPlayer = self.videoPlayer{
                layer.addSublayer(customPlayer)
            }
        }
        
    }
    
    func play() {
        avPlayer?.play()
    }

}
