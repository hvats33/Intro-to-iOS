//
//  SignUpCoordinator.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 31/07/22.
//

import UIKit

class SignUpCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    weak var parentCoordinator: MainCoordinator?
    weak var parentCoordinator01: ForgotPasswordCoordinator?
    
    init(_navigationControlller: UINavigationController) {
        self.navigationController = _navigationControlller
    }
    
    func start() {
        let signUpVC = SignUpVC.instantiate(storyboard: .login)
        signUpVC.coordinator = self
        navigationController.pushViewController(signUpVC, animated: true)
    }
    // pass to home
    func signUp() {
        UIApplication.shared.setRootController(vc: .homeVC, stroybordName: .home)
    }
        // pass to sign in controller
    func login() {
        if let _ = parentCoordinator {
            navigationController.popViewController(animated: true)
            return
        }
        if let _ = parentCoordinator01 {
              let viewControllers = self.navigationController.viewControllers
                guard viewControllers.count < 3 else {
                self.navigationController.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
                        return
                }
            return
        }
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
    func didFinishingSignUp() {
        if let currentParent = parentCoordinator {
            currentParent.childDidFinish(self)
            return
        }
        if let currentParent = parentCoordinator01 {
            currentParent.childDidFinish(self)
            return
        }
    }
}
