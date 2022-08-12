//
//  SignUpValidator.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 31/07/22.
//

import Foundation

struct SignUpValidator {
    static func validateSignUp(name: String?, email: String?, password: String?) -> ValidateResult {
        guard name?.isEmpty != true else {
            return ValidateResult(isValid: false, message: "Please enter your name")
        }
        guard Validate.isValidEmail(email ?? "") else {
            return ValidateResult(isValid: false, message: "Please enter valid email address")
        }
        
        guard Validate.isValidPassword(password: password ?? "") else {
            return ValidateResult(isValid: false, message: "Please enter strong password")
        }
        
        return ValidateResult(isValid: true, message: "")
    }
}
