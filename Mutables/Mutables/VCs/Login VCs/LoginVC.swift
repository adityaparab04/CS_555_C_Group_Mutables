//
//  LoginVC.swift
//  Mutables
//
//  Created by Rahul Pawar on 2/26/22.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import AuthenticationServices
import CryptoKit

class LoginVC: UIViewController {

    @IBOutlet weak var appleSignInBtn: UIButton!
    @IBOutlet weak var signUpBtnPressed: UIButton!
    @IBOutlet weak var googleSignInBtn: UIButton!
    
    let userDefault = UserDefaults.standard
    
    // Unhashed nonce.
    fileprivate var currentNonce: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK:- Google sign in method
    
    @IBAction func appleSignInBtnPressed(_ sender: UIButton) {
        startSignInWithAppleFlow()
    }
    
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }

    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
    }

        
    @available(iOS 13, *)
    func startSignInWithAppleFlow() {
      let nonce = randomNonceString()
      currentNonce = nonce
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.fullName, .email]
      request.nonce = sha256(nonce)

      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
     // authorizationController.presentationContextProvider = self
      authorizationController.performRequests()
    }
    
    
    //MARK:- Google Sign in method
    
    @IBAction func googleSignInBtnPressed(_ sender: UIButton) {
        let signInConfig = GIDConfiguration.init(clientID: "560954900840-et36blb7001q5kq4i8rtsbsjkr1b7krp.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction.init(title: "Okay", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            } else{
                print("Success in google signin")
                self.performSegue(withIdentifier: "goToHomeVC", sender: self)
                self.userDefault.set(true, forKey:"userSignedIn")
                self.userDefault.synchronize()
                
            }
        }
    }
    
    
    
    
}

@available(iOS 13.0, *)
extension LoginVC: ASAuthorizationControllerDelegate {

  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
      guard let nonce = currentNonce else {
        fatalError("Invalid state: A login callback was received, but no login request was sent.")
      }
      guard let appleIDToken = appleIDCredential.identityToken else {
        print("Unable to fetch identity token")
        return
      }
      guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
        print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
        return
      }
      // Initialize a Firebase credential.
      let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                idToken: idTokenString,
                                                rawNonce: nonce)
      // Sign in with Firebase.
      Auth.auth().signIn(with: credential) { (authResult, error) in
          if (error != nil) {
          // Error. If error.code == .MissingOrInvalidNonce, make sure
          // you're sending the SHA256-hashed nonce as a hex string with
          // your request to Apple.
              print(error?.localizedDescription)
          return
        }
        // User is signed in to Firebase with Apple.
        // ...
          print("Apple sign in successful")
          self.performSegue(withIdentifier: "goToHomeVC", sender: self)
          self.userDefault.set(true, forKey:"userSignedIn")
          self.userDefault.synchronize()
      }
    }
  }

  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // Handle error.
    print("Sign in with Apple errored: \(error)")
      
  }

}

