//
//  MainCoordinator.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 31/07/22.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set}
    var navigationController: UINavigationController { get set }
    
    func start()
    
}
extension Coordinator {
    func start() { }
}
class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    
    init(_navigationControlller: UINavigationController) {
        self.navigationController = _navigationControlller
    }
    
    func start() {
        let signInVC = SignInVC.instantiate(storyboard: .login)
        signInVC.coordinator = self
        self.navigationController.pushViewController(signInVC, animated: true)
    }
    func signIn() {
        UIApplication.shared.setRootController(vc: .homeVC, stroybordName: .home)
    }
    func signUp() {
        let child = SignUpCoordinator(_navigationControlller: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
        
    }
    func forgotPassword() {
        let child = ForgotPasswordCoordinator(_navigationControlller: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    // Remove Child
    func childDidFinish( _ child: Coordinator?) {
        for (index,coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
