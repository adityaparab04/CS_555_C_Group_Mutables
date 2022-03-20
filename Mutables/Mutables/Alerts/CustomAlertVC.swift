//
//  CustomAlertVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 3/19/22.
//

import UIKit

class CustomAlertVC: UIViewController {

    @IBOutlet weak var alertImageView: UIImageView!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var alertBodyLabel: UILabel!
    @IBOutlet weak var alertBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func alertBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
