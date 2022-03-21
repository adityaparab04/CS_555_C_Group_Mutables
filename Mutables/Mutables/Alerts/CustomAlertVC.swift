//
//  CustomAlertVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 3/19/22.
//

import UIKit
import AVFoundation



class CustomAlertVC: UIViewController {
    
    var player: AVAudioPlayer?
    
    let music = Music()
    

    @IBOutlet weak var alertImageView: UIImageView!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var alertBodyLabel: UILabel!
    @IBOutlet weak var alertBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
       
    }


    @IBAction func alertBtnPressed(_ sender: UIButton) {
        player?.stop()
        dismiss(animated: true)
    }
    
    
}
