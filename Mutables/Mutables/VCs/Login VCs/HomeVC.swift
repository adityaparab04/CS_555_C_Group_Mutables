//
//  HomeVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 2/27/22.
//

import UIKit
import FirebaseAuth

class HomeVC: UIViewController {
    let music = Music()

    @IBOutlet weak var volumeBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        music.startMusic(fileName: "homescreen", format: "mp3", volume: 0.5, loop: -1)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
  
    @IBAction func audioBtnPressed(_ sender: UIBarButtonItem) {
        print("Audio Btn pressed")
    }
    
}
