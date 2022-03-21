//
//  SecondScreenVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 3/20/22.
//

import UIKit

class SecondScreenVC: UIViewController {
    
    let music = Music()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        music.startMusic(fileName: "background", format: "mp3", volume: 0.3, loop: -1)
    }
    


}
