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
   
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.dismiss(animated: true, completion: nil)
        }
       
       
    }


    
    
}
