//
//  SignUpViewController.swift
//  Thought
//
//  Created by Parth Raval on 2022-05-03.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var textFieldFirstName: UITextField!
    @IBOutlet weak var textFieldLastName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    
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
    @IBAction func signUpBtnTapped(_ sender: Any) {
        self.view.endEditing(true)
        
        if !self.isValidated() {
            return
        }
        
        // Create cleaned versions of the data
        let firstName = textFieldFirstName.text!.trim()
        let lastName = textFieldLastName.text!.trim()
        let email = textFieldEmail.text!.trim()
        let password = textFieldPassword.text!.trim()
        
        // create the user
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            //check for errors
            if err != nil {
                // There was an error creating the user
                //TODO: Use Custom Validation Toast
                jprint("Error Creating the User")
            } else {
                // user was created successfully, now store firstname and lastname
                _firestoreDB.collection("users").addDocument(data: ["firstname": firstName, "lastname": lastName, "uid": result!.user.uid]) { error in
                    
                    if let error = error {
                        //TODO: handle error
                        jprint("Error saving user data \(error)")
                    }
                }
                
                // Navigate to the home screen
                self.naviToHomeVC()
            }
        }
    }
    
    @IBAction func signInBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - Validation
extension SignUpViewController {
    
    func isValidated() -> Bool {
        if self.textFieldFirstName.text!.trim().isEmpty {
            //TODO: use custom validation toast
            jprint("First Name can not be empty")
            return false
        }
        
        if self.textFieldLastName.text!.trim().isEmpty {
            //TODO: use custom validation toast
            jprint("Last Name can not be empty")
            return false
        }
        
        if self.textFieldEmail.text!.trim().isEmpty {
            //TODO: use custom validation toast
            jprint("Email can not bt empty")
            return false
        }
        
        if !self.textFieldEmail.text!.trim().isValidEmail() {
            //TODO: use custom validation toast
            jprint("Entered Email is not valid")
            return false
        }
        
        if !self.textFieldPassword.text!.trim().isValidPassword() {
            //TODO: use custom validation toast
            jprint("Password should be atleast 8 characters long and should be combination of atleast 1 special character, lower case & upper case!")
            return false
        }
        
        return true
    }

}
