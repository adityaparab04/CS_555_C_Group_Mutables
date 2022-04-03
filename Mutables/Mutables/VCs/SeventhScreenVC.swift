//
//  SeventhScreenVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 4/3/22.
//

import UIKit

class SeventhScreenVC: UIViewController {
    
    let music = Music()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        music.startMusic(fileName: "background", format: "mp3", volume: 0.3, loop: -1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

}
