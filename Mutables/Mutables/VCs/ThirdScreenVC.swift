//
//  ThirdScreenVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 3/20/22.
//

import UIKit


class ThirdScreenVC: UIViewController {
    
    @IBOutlet weak var optionsStackView: UIStackView!
    let music = Music()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        music.startMusic(fileName: "forest", format: "mp3", volume: 0.3, loop: -1)
    }
    


    @IBAction func youRefustedPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let alert = storyboard.instantiateViewController(withIdentifier: "YouLostAlertVC")
        alert.modalPresentationStyle = .overCurrentContext
        present(alert, animated: true) {
            print("You lost")
            self.music.startMusic(fileName: "lost", format: "wav", volume: 1.0, loop: 0)
        }
        optionsStackView.alpha = 0
    }
}
