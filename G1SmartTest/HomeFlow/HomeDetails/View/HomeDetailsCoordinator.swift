//
//  HomeDetailsCoordinator.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 04/08/22.
//

import UIKit

class HomeDetailsCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
   weak var parentCoordinator: HomeCoordinator?
    
    init(_navigationControlller: UINavigationController) {
        self.navigationController = _navigationControlller
    }
    
    func startWithData(model: HomeModel) {
        let vc = HomeDetailsVC.instantiate(storyboard: .home)
        vc.coordinator = self
        vc.getDetails(model: model)
        navigationController.pushViewController(vc, animated: true)
    }
    func back() {
        navigationController.popViewController(animated: true)
    }
    func yourScore(score: String) {
        let child = YourScoreCoordinator(_navigationControlller: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start(score: score)
    }
    func didFinishingHomeDetails() {
        parentCoordinator?.childDidFinish(self)
    }
    func childDidFinish( _ child: Coordinator?) {
        for (index,coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
