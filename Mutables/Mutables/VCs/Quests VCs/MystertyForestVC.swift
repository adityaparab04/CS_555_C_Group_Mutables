//
//  MystertyForestVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 3/20/22.
//

import UIKit
import AudioToolbox

class MystertyForestVC: UIViewController {
    
    
    @IBOutlet weak var questTitle: UILabel!
    @IBOutlet weak var swordImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func swordLongPressed(_ sender: UILongPressGestureRecognizer) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        self.swordImage.alpha = 0
        self.questTitle.alpha = 0
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let alert = storyboard.instantiateViewController(withIdentifier: "CustomAlertVC")
        alert.modalPresentationStyle = .overCurrentContext
        
        self.present(alert, animated: true) {
            print("Sword Tapped")
        }
        
    }
    
    @IBAction func swordImagedLongTapped(_ sender: UITapGestureRecognizer) {
      
        
    }
}
