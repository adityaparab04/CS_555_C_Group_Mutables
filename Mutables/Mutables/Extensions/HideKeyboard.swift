//
//  HideKeyboard.swift
//  Mutables
//
//  Created by Rahul Pawar on 2/27/22.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
}
