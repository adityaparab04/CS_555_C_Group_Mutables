//
//  MystertyForestVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 3/20/22.
//

import UIKit
import AudioToolbox
import AVFoundation

class MystertyForestVC: UIViewController {
    
    
    @IBOutlet weak var questTitle: UILabel!
    @IBOutlet weak var swordImage: UIImageView!
    
    var player : AVAudioPlayer?
    let customAlert = CustomAlertVC()
    let music = Music()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
 

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

  
    @IBAction func swordLongPressed(_ sender: UILongPressGestureRecognizer) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        self.swordImage.alpha = 0
        self.questTitle.alpha = 0
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let alert = storyboard.instantiateViewController(withIdentifier: "CustomAlertVC")
        alert.modalPresentationStyle = .overCurrentContext
        
        self.present(alert, animated: true) {
            self.music.startMusic(fileName: "victory", format: "mp3", volume: 1.0, loop: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.performSegue(withIdentifier: "goToFifthScreenVC", sender: self)
            }
        }
        
    }
    
   
}
