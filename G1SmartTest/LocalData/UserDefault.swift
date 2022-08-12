//
//  UserDefault.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 02/08/22.
//

import Foundation
typealias UD = UserDefault

struct UserDefault {
    
    static func saveUser(email: String, name: String) {
        UserDefaults.standard.set(email, forKey: "email")
       UserDefaults.standard.set(name, forKey: "name")
    }
    
    static func fetchEmail() -> String {
        return UserDefaults.standard.value(forKey: "email") as? String ?? ""
    }
    static func fetchUserName() -> String {
        return UserDefaults.standard.value(forKey: "name") as? String ?? ""
    }
    static func removeAll() {
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "name")
    }
}
