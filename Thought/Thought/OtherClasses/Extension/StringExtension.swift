//
//  StringExtension.swift
//  Thought
//
//  Created by Parth Raval on 2022-05-03.
//

import Foundation

extension String {
    func trim() -> String {
        let strTrimmed = (NSString(string: self)).trimmingCharacters(in: .whitespaces)
        return strTrimmed
    }
    
    //Password Validation
    func isValidPassword() -> Bool {
        let passRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passTest = NSPredicate(format: "SELF MATCHES %@", passRegEx)
        return passTest.evaluate(with: self)
    }
    
    //Email Validation
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
