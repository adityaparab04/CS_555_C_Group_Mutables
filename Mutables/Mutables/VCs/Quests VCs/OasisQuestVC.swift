//
//  OasisQuestVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 4/19/22.
//

import UIKit

class OasisQuestVC: UIViewController {
    
    let music = Music()

    @IBOutlet weak var correctOasisImage: UIImageView!
    @IBOutlet weak var findOasisTitle: UILabel!
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
    @IBAction func correctOasisTapped(_ sender: UITapGestureRecognizer) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        self.findOasisTitle.alpha = 0
        self.correctOasisImage.alpha = 0
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let alert = storyboard.instantiateViewController(withIdentifier: "OasisAlertVC")
        alert.modalPresentationStyle = .overCurrentContext
        
        self.present(alert, animated: true) {
            self.music.startMusic(fileName: "victory", format: "mp3", volume: 1.0, loop: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.performSegue(withIdentifier: "goToFourteenthSceenVC", sender: self)
            }
        }
    }
    
}
