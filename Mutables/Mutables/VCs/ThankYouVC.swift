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

    @IBOutlet weak var thankYouView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupAnimation()
        music.startMusic(fileName: "thank_you", format: "wav", volume: 0.5, loop: -1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    
    func setupAnimation(){
        thankYouView.animation = Animation.named("thankYou")
        thankYouView.frame = thankYouView.bounds
        thankYouView.contentMode = .scaleAspectFit
        thankYouView.loopMode = .loop
        thankYouView.play()
        view.addSubview(thankYouView)
        print("Thank you animation")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.performSegue(withIdentifier: "goToHomeVC", sender: self)
            self.music.stopMusicPlayer()
        }
    }
  
}
