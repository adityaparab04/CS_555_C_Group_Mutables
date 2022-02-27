//
//  LoginVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 2/26/22.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var signUpBtnPressed: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

}
