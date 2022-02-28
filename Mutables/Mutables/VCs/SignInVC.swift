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

    @IBAction func arrowBtnPressed(_ sender: UIButton) {
        guard let email = emailTF.text, let password = passwordTF.text else {return}
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        if emailPred.evaluate(with: email) == true && passwordPred.evaluate(with: password) == true {
            Auth.auth().signIn(withEmail: email, password: password) { result, err in
                if err != nil {
                    let alert = UIAlertController(title: "Error Sign-in", message: err?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction.init(title: "Try Again", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    print("Successfull Sign-in")
                    self.performSegue(withIdentifier: "goToHomeVC", sender: self)
                }
            }
        } else {
            let alert = UIAlertController(title: "Invalid Credentials", message: "You have entered invalid credentials, please verify and try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Try again", style: .default, handler: { action in
                self.emailTF.text = ""
                self.passwordTF.text = ""
                self.emailTF.becomeFirstResponder()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
