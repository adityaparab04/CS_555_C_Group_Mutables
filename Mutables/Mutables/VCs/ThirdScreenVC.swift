//
//  ThirdScreenVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 3/20/22.
//

import UIKit

class ThirdScreenVC: UIViewController {

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

    @IBAction func youRefustedPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let alert = storyboard.instantiateViewController(withIdentifier: "YouLostAlertVC")
        alert.modalPresentationStyle = .overCurrentContext
        present(alert, animated: true) {
            print("You lost")
        }
    }
}
