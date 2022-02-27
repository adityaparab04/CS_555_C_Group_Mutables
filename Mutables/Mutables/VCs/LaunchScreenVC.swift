//
//  LaunchScreenVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 2/12/22.
//

import UIKit

class LaunchScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.performSegue(withIdentifier: "goToLoginVC", sender: self)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }


}

