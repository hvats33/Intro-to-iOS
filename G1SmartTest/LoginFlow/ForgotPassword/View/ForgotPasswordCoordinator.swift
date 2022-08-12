//
//  ForgotPasswordCoordinator.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 31/07/22.
//

import UIKit

class ForgotPasswordCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    weak var parentCoordinator: MainCoordinator?
    
    init(_navigationControlller: UINavigationController) {
        self.navigationController = _navigationControlller
    }
    
    func start() {
        let forgotVC = ForgotPasswordVC.instantiate(storyboard: .login)
        forgotVC.coordinator = self
        self.navigationController.pushViewController(forgotVC, animated: true)
    }
    
    // pass to login controller
    func login() {
        self.navigationController.popViewController(animated: true)
    }
    // Pass to sign up controller
    func signUp() {
        let child = SignUpCoordinator(_navigationControlller: navigationController)
        child.parentCoordinator01 = self
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
    func didFinishingForgotPassword() {
        parentCoordinator?.childDidFinish(self)
    }
}
