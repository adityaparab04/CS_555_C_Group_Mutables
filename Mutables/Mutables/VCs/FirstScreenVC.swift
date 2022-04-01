//
//  FirstScreenVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 3/20/22.
//

import UIKit



class FirstScreenVC: UIViewController {
    
    let music  = Music()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        music.startMusic(fileName: "background", format: "mp3", volume: 0.3, loop: -1)
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
