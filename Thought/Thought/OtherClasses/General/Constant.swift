//
//  Constant.swift
//  Thought
//
//  Created by Parth Raval on 2022-05-03.
//

import Foundation
import UIKit
import Firebase

let _appDelegator = { return UIApplication.shared.delegate! as! AppDelegate }()
let _firestoreDB = Firestore.firestore()

struct Identifier {
    static let signUpVC = "SignUpViewController"
    static let signInVC = "SignInViewController"
    static let homeVC = "HomeViewController"
}

//MARK: - Global Functions
func jprint(_ items: Any...) {
    // debug only code
    #if DEBUG
    for item in items {
        print(item)
    }
    #endif
}
