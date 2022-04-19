//
//  MeditateQuestVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 4/19/22.
//

import UIKit
import Lottie

class MeditateQuestVC: UIViewController {
    
    let music = Music()
    
    var timer = Timer()
    
    var seconds = 60
  
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var animationViewSun: AnimationView!
   // let animationViewSun = AnimationView()
   // let animationViewMan = AnimationView()
    @IBOutlet weak var animationViewMan: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        music.startMusic(fileName: "birds_forest", format: "mp3", volume: 0.3, loop: -1)
        setupSunAnimation()
        setupManAnimation()
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MeditateQuestVC.timerClass), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        navigationController?.hidesBarsOnSwipe = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationController?.hidesBarsOnSwipe = false
    }
    
    func setupSunAnimation(){
        animationViewSun.animation = Animation.named("meditating_sun")
        animationViewSun.frame = animationViewSun.bounds
       // animationViewSun.backgroundColor = .clear
        animationViewSun.contentMode = .scaleAspectFit
        animationViewSun.loopMode = .loop
        animationViewSun.play()
        view.addSubview(animationViewSun)
        print("Sun animation")
    }
    
    func setupManAnimation(){
        animationViewMan.animation = Animation.named("meditate_man")
        animationViewMan.frame = animationViewMan.bounds
       // animationViewMan.backgroundColor = .clear
        animationViewMan.contentMode = .scaleAspectFit
        animationViewMan.loopMode = .loop
        animationViewMan.play()
        view.addSubview(animationViewMan)
        print("Man animation")
    }
    
    @objc func timerClass(){
        seconds -= 1
        timerLabel.text = String(seconds)
        
        if (seconds == 1){
            timer.invalidate()
            DispatchQueue.main.asyncAfter(deadline: .now()+1.0) { [self] in
                self.performSegue(withIdentifier: "goToSeventeenthScreenVC", sender: self)
                self.music.stopMusicPlayer()
            }
        }
    }
}
