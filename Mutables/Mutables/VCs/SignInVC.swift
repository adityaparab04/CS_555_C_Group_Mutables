//
//  SignInVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 2/27/22.
//

import UIKit
import FirebaseAuth


class SignInVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTF {
            passwordTF.becomeFirstResponder()
        } else{
            passwordTF.resignFirstResponder()
        }
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTF.becomeFirstResponder()
        
        textFieldDesign(textfield: emailTF, placeholderText: "you@lorem.com")
        textFieldDesign(textfield: passwordTF, placeholderText: "Password")
    }
    
    
    
    func textFieldDesign(textfield: UITextField, placeholderText: String){
        textfield.layer.cornerRadius = 20.0
        textfield.clipsToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.black.cgColor
        
        
        textfield.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )

    }

}
