//
//  UIApplication+Extension.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 02/08/22.
//

import UIKit

extension UIApplication {
    
    func setRootController(vc:StoryboardID, stroybordName: AppStoryboard, animation: UIView.AnimationOptions? = .transitionFlipFromRight){
        let storyboard = UIStoryboard(name: stroybordName.name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vc.VCID)
        let navVC = UINavigationController(rootViewController: vc)
        navVC.setNavigationBarHidden(true, animated: false)
        guard let window = UIApplication.shared.windows.first else {
            UIApplication.shared.windows.first?.rootViewController = navVC
            UIApplication.shared.windows.first?.makeKeyAndVisible()
         return }
        
        
        guard let transition = animation else {
            window.rootViewController = navVC
            window.makeKeyAndVisible()
            return
        }
            UIView.transition(with: window, duration: 0.5, options: transition, animations: {
                window.rootViewController = navVC
            }, completion: nil)
        window.makeKeyAndVisible()
       }
}
