//
//  SignUpEmailVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 2/27/22.
//

import UIKit

class SignUpEmailVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var arroeBtn: UIButton!
    
    let validation = Validation()
    let userDefaults = UserDefaults.standard
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTF.layer.cornerRadius = 20.0
        emailTF.clipsToBounds = true
        emailTF.layer.borderWidth = 1.0
        emailTF.layer.borderColor = UIColor.black.cgColor
        emailTF.becomeFirstResponder()
        
        emailTF.attributedPlaceholder = NSAttributedString(
            string: "you@lorem.com",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
    }
    

    
    @IBAction func arrowBtnPressed(_ sender: UIButton) {
        guard let email = emailTF.text else {return}
   
        
        
        if validation.emailValidationa(email: email) == true{
            userDefaults.set(email, forKey: "signUpEmail")
            self.performSegue(withIdentifier: "goToSignUpPassVC", sender: self)
        } else {
            let alert = UIAlertController(title: "Invalid Email", message: "Your email \(email) is invalid, please confirm and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Try Again", style: .default, handler: nil))

            self.present(alert, animated: true, completion: nil)

        }
        
        
        
    }
    
}
