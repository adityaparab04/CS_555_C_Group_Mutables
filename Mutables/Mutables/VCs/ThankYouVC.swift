//
//  ThankYouVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 4/19/22.
//

import UIKit
import Lottie

class ThankYouVC: UIViewController {
    
    let music = Music()
    let animation  = Animations()

    @IBOutlet weak var thankYouView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupBehavior()
        music.startMusic(fileName: "thank_you", format: "wav", volume: 0.5, loop: -1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    
    func setupBehavior(){
        animation.setupAnimation(animationView: thankYouView, animationName: "thankYou", view: view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.performSegue(withIdentifier: "goToHomeVC", sender: self)
            self.music.stopMusicPlayer()
        }
    }
  
}
