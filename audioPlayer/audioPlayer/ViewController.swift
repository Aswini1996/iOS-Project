//
//  ViewController.swift
//  audioPlayer
//
//  Created by ASWINI BEHERA on 03/03/19.
//  Copyright © 2019 myOrg. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var Player : AVAudioPlayer = AVAudioPlayer()

    @IBAction func play(_ sender: UIButton)
    {
        Player.play()
    }
    
    
    @IBAction func pause(_ sender: UIButton)
    {
        Player.pause()
    }
    
    
    @IBAction func replay(_ sender: UIButton)
    {
        Player.currentTime = 0
    }
    
    @IBAction func slider(_ sender: UISlider)
    {
        Player.volume = sender.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        do
        {
            
            let audioPath = Bundle.main.path(forResource: "Agar Tum Saath Ho", ofType:"mp3")
            try Player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            
        }
        catch
            {
                //error
                
            }
    }


}

