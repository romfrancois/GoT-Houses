//
//  SplashScreenViewController.swift
//  GoT-Houses
//
//  Created by Romain Francois on 24/07/2020.
//  Copyright © 2020 Romain Francois. All rights reserved.
//

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var throneImageView: UIImageView!
    
    var throneImageY: CGFloat!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playSound(name: "GoT_theme")
        
        // Save original location so we can animate back to this spot. Only the y value will change since we're moving vertically
        throneImageY = throneImageView.frame.origin.y
        
        // move the upper left point of the image so it's just off screen, to the bottom of the view controller
        throneImageView.frame.origin.y = self.view.frame.height
        
        UIView.animate(
            withDuration: 1.0,
            delay: 1.0,
            animations: {
                self.throneImageView.frame.origin.y = self.throneImageY
            }
        )
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print(" ERROR: \(error.localizedDescription)")
            }
        } else {
            print("ERROR: Could not read data from file \(name)")
        }
    }
    
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        if audioPlayer != nil {
            audioPlayer.stop()
        }
        
        performSegue(withIdentifier: "ShowTableView", sender: nil)
    }
    
    
}
