//
//  CoordinatorBoard.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 31/07/22.
//

import UIKit


protocol CoordinatorBoard: UIViewController {
   static func instantiate(storyboard: AppStoryboard) -> Self
}

extension CoordinatorBoard {
    
    static func instantiate(storyboard: AppStoryboard) -> Self {
        let storyboard = UIStoryboard(name: storyboard.name, bundle: nil)
        
        let storyboardId: String = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: storyboardId) as! Self
    }
    
}
