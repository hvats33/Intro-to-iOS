//
//  YourScoreCoordinator.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 06/08/22.
//

import UIKit

class YourScoreCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
   weak var parentCoordinator: HomeDetailsCoordinator?
    
    init(_navigationControlller: UINavigationController) {
        self.navigationController = _navigationControlller
    }
    
    func start(score: String) {
        let vc = YourScoreVC.instantiate(storyboard: .home)
        vc.coordinator = self
        vc.getScore(score: score)
        navigationController.pushViewController(vc, animated: true)
    }
    func back() {
        navigationController.popViewController(animated: true)
    }
    func home() {
        navigationController.popToRootViewController(animated: true)
    }
    func didFinishingYourScore() {
        parentCoordinator?.childDidFinish(self)
    }
}

