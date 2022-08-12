//
//  UIWindow+Extension.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 31/07/22.
//


import SwiftUI
import UIKit

extension UIWindow {

    static func getAppdelegate() -> AppDelegate? {
        if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
            return appdelegate
        }
        return nil
    }
    
    static func getWindow() -> UIWindow? {
        let window = UIApplication.shared.windows.first
       
        return window
    }
}

extension UIWindow {
   var visibleViewController: UIViewController? {
       return UIWindow.getVisibleViewControllerFrom(vc: self.rootViewController)
   }

   static func getVisibleViewControllerFrom(vc: UIViewController?) -> UIViewController? {
       if let nc = vc as? UINavigationController {
           return UIWindow.getVisibleViewControllerFrom(vc: nc.visibleViewController)
       } else if let tc = vc as? UITabBarController {
           return UIWindow.getVisibleViewControllerFrom(vc: tc.selectedViewController)
       } else {
           if let pvc = vc?.presentedViewController {
               return UIWindow.getVisibleViewControllerFrom(vc: pvc)
           } else {
               return vc
           }
       }
   }
}
