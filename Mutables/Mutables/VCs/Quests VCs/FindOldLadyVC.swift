//
//  FindOldLadyVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 4/4/22.
//

import UIKit

class FindOldLadyVC: UIViewController {
    
    let music = Music()
    
    let findOldLadyAlert = FindOldLadyAlertVC()

    @IBOutlet weak var findOldLadyTitle: UILabel!
    @IBOutlet weak var oldLadyImage: UIImageView!
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
    

    @IBAction func oldLadyFoundTapped(_ sender: UITapGestureRecognizer) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        self.findOldLadyTitle.alpha = 0
        self.oldLadyImage.alpha = 0
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let alert = storyboard.instantiateViewController(withIdentifier: "FindOldLadyAlertVC")
        alert.modalPresentationStyle = .overCurrentContext
        
        self.present(alert, animated: true) {
            self.music.startMusic(fileName: "victory", format: "mp3", volume: 1.0, loop: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.performSegue(withIdentifier: "goToNinthScreenVC", sender: self)
            }
        }
        
    }
    
}
