//
//  OrderConfirmationViewController.swift
//  Restaurant Menu
//
//  Created by Fabiola Saga on 4/23/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class OrderConfirmationViewController: UIViewController {

    
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    var minutes: Int!
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        timeRemainingLabel.text = "Thank you for your order! your wait time is approximately \(minutes!) minutes."
        setUpView()
        
    }
    
    private func setUpView() {
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "cookingVideo", ofType: "mp4")!)
        let player = AVPlayer(url: path)
        
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = self.videoView.frame
        self.videoView.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        loopVideo(videoPlayer: player)
        player.play()
    }
    
    func loopVideo(videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            videoPlayer.seek(to: CMTime.zero)
            videoPlayer.play()
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
