//
//  SignInValidator.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 31/07/22.
//

import Foundation

struct SignInValidator {
    
    static func validateSignIn(model: SignInModel) -> ValidateResult {
        guard Validate.isValidEmail(model.email) else {
            return ValidateResult(isValid: false, message: "Please enter valid email address")
        }
        
        guard Validate.isValidPassword(password: model.password) else {
            return ValidateResult(isValid: false, message: "Please enter strong password")
        }
        
        return ValidateResult(isValid: true, message: "")
    }
}
