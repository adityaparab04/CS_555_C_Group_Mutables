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
    
    let animation = Animations()
    
    var timer = Timer()
    
    var seconds = 60
  
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var animationViewSun: AnimationView!
   // let animationViewSun = AnimationView()
   // let animationViewMan = AnimationView()
    @IBOutlet weak var animationViewMan: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        music.startMusic(fileName: "birds_forest", format: "mp3", volume: 0.3, loop: -1)
        sunBehavior()
        manBehavior()
        
        skipBtnBehavior()
        
       
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
    func skipBtnBehavior(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 30.00) {
            self.skipBtn.alpha = 1
            
        }
    }
    func sunBehavior(){
        animation.setupAnimation(animationView: animationViewSun, animationName: "meditating_sun", view: view)
        
        print("Sun animation")
    }
    
    func manBehavior(){
        animation.setupAnimation(animationView: animationViewMan, animationName: "meditate_man", view: view)
        print("Man animation")
    }
    

    @IBAction func skipBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSeventeenthScreenVC", sender: self)
    }
}
