//
//  SignUpPassVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 2/27/22.
//

import UIKit
import FirebaseAuth

class SignUpPassVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var confPassTF: UITextField!
    @IBOutlet weak var arrowBtn: UIButton!
    
    let userDefaults = UserDefaults.standard
    
    let validation = Validation()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passTF{
            confPassTF.becomeFirstResponder()
        }else{
            confPassTF.resignFirstResponder()
        }
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passTF.becomeFirstResponder()
        
        textFieldDesign(textfield: passTF, placeholderText: "Password")
        textFieldDesign(textfield: confPassTF, placeholderText: "Confirm Password")
        // Do any additional setup after loading the view.
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
        guard let password = passTF.text, let confirmPass = confPassTF.text else {return}
        
        let email = userDefaults.object(forKey: "signUpEmail") as! String
        
//        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
//
//        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        
        if password == confirmPass && validation.passwordValidation(password: password) == true{
            Auth.auth().createUser(withEmail: email, password: confirmPass) { result, err in
                if err == nil {
                    print("Success Signed up")
                    let alert = UIAlertController(title: "Welcome to Mutable", message: "Your account created successfully", preferredStyle: .alert)
                    alert.addAction(UIAlertAction.init(title: "Great!", style: .default, handler: { action in
                        self.performSegue(withIdentifier: "goToHomeVC", sender: self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "Error Sign up", message: err?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction.init(title: "Try Again", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        } else {
            let alert = UIAlertController(title: "Invalid Password", message: "Password is invalid please try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Try Again", style: .default, handler: { action in
                self.passTF.text = ""
                self.confPassTF.text = ""
                self.passTF.becomeFirstResponder()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
