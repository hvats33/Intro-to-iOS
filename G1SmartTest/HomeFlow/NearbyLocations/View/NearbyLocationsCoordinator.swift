//
//  NearbyLocationsCoordinator.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 11/08/22.
//

import UIKit

class NearbyLocationsCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
   weak var parentCoordinator: HomeCoordinator?
    
    init(_navigationControlller: UINavigationController) {
        self.navigationController = _navigationControlller
    }
    
    func start() {
        let vc = NearbyLocationsVC.instantiate(storyboard: .home)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func back() {
        navigationController.popViewController(animated: true)
    }
    
    func didFinishingNearbyLocations() {
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
