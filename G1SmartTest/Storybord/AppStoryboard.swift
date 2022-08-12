//
//  AppStoryboard.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 31/07/22.
//

import Foundation


enum AppStoryboard {
    
    case login
    case home
    
    var name: String {
        switch self {
        case .login:
            return "LoginFlow"
        case .home:
            return "HomeFlow"
        }
    }
}
enum StoryboardID {
    
    case loginVC
    case homeVC
    
    var VCID: String {
        switch self {
        case .loginVC:
            return "SignInVC"
        case .homeVC:
            return "HomeVC"
        }
    }
}
