//
//  HomeVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 2/27/22.
//

import UIKit
import FirebaseAuth

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
  
    @IBAction func audioBtnPressed(_ sender: UIButton) {
        print("1")
    }
}
