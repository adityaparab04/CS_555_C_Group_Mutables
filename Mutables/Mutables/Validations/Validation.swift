//
//  Validation.swift
//  Mutables
//
//  Created by Rahul Pawar on 3/1/22.
//

import UIKit
import FirebaseAuth

struct Validation{

     func emailValidationa(email: String) ->  Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
       // guard email.count > 0 else { throw ValidationError.emptyEmail }
        
        if emailPred.evaluate(with: email) == true{
            print("Valid email")
            return true
            
        } else {
            print("Invalid email")
            return false
            
        }
        
    }
    
     func passwordValidation(password:String) -> Bool{
        
//        if password.count == 0 {throw ValidationError.emptyPassword}
//
//        guard password.count >= 8 else {throw ValidationError.tooShortPassword}
        
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        
        if passwordPred.evaluate(with: password) == true{
            print("Valid password")
            return true
            
        } else {
            print("Invalid Password")
            return false
        }
        
        
    }
    
}

enum ValidationError: LocalizedError{
    case emptyEmail
    case invalidEmail
    case emptyPassword
    case tooShortPassword
    case invalidPassword
    
    var errorDescription: String?{
        switch self{
        case .emptyEmail:
            return "Email is empty"
        case .invalidEmail:
            return "Email is invalid"
        case .emptyPassword:
            return "Password is empty"
        case .tooShortPassword:
            return "Password is less than 8 characters"
        case .invalidPassword:
            return "Password is invalid"
        }
    }
}
