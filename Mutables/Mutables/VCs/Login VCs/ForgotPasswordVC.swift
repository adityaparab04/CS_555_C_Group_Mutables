//
//  ForgotPasswordVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 2/28/22.
//

import UIKit
import FirebaseAuth

class ForgotPasswordVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTF.becomeFirstResponder()
        textFieldDesign(textfield: emailTF, placeholderText: "you@lorem.com")
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
    @IBAction func arrowBtnPressed(_ sender: Any) {
        guard let email = emailTF.text else {return}
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if emailPred.evaluate(with: email) == true{
            Auth.auth().sendPasswordReset(withEmail: email) { err in
                if err != nil {
                    let alert = UIAlertController(title: "Invalid email", message: err?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction.init(title: "Try again", style: .default, handler: { action in
                        self.emailTF.text = ""
                        self.emailTF.becomeFirstResponder()
                    }))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Link sent successfully", message: "Password reset link successfully sent to \(email)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction.init(title: "Great!", style: .default, handler: { action in
                        self.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        } else {
            let alert = UIAlertController(title: "Invalid email", message: "\(email) is invalid, please verify and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Try again", style: .default, handler: { action in
                self.emailTF.text = ""
                self.emailTF.becomeFirstResponder()
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
}
