//
//  ViewController.swift
//  hustle-mode
//
//  Created by Gertjan Rösken on 24-04-18.
//  Copyright © 2018 GoeiePeer. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    @IBOutlet weak var reloadBtn: UIButton!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }

    @IBAction func pwrBtnPressed(_ sender: Any) {
        
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        reloadBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 140, width: 375, height: 431)
        }) { (finished) in
         //   self.hustleLbl.isHidden = false
         //   self.onLbl.isHidden = false
            self.reloadBtn.isHidden = false
        }
        
    }
    
    @IBAction func reloadBtnPressed(_ sender: Any) {
      
        self.rocket.frame = CGRect(x: 0, y: 400, width: 375, height: 431)
        cloudHolder.isHidden = true
        darkBlueBG.isHidden = false
        powerBtn.isHidden = false
        reloadBtn.isHidden = true
        
        
    }
    
    
}

