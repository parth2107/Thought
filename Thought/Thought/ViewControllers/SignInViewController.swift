//
//  ViewController.swift
//  Thought
//
//  Created by Parth Raval on 2022-05-02.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func naviToHomeVC() {
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: Identifier.homeVC) as! HomeViewController
        self.view.window?.rootViewController = vc
        self.view.window?.makeKeyAndVisible()
    }
    
    //MARK: - Actions
    @IBAction func signInBtnTapped(_ sender: UIButton) {
        self.view.endEditing(true)
        if !self.isValidated() {
            return
        }
        
        let email = textFieldEmail.text!.trim()
        let password = textFieldPassword.text!.trim()
        
        // Firebase sign in method
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
           // check for the error
            if let error = error {
                //TODO: Handle Error - use custom validation toast
                jprint("Handle Error => \(error.localizedDescription)")
            } else {
                //Navigate to the home
                jprint("loggedIn user info => \(String(describing: result!.user))")
                self.naviToHomeVC()
                
            }
        }
    }
    
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Identifier.signUpVC) as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

//MARK: - Validation

extension SignInViewController {
    
    func isValidated() -> Bool {
        if self.textFieldEmail.text!.trim().isEmpty {
            //TODO: Add custom validation toast
            jprint("Please enter an email")
            return false
        }
        
        if !self.textFieldEmail.text!.trim().isValidEmail() {
            //TODO: use custom validation toast
            jprint("Entered Email is not valid")
            return false
        }
        
        if !self.textFieldPassword.text!.trim().isValidPassword() {
            //TODO: Add custom validation toast
            jprint("Password should be atleast 8 characters long and should be combination of atleast 1 special character, lower case & upper case!")
            return false
        }
        
        return true
    }
    
}
