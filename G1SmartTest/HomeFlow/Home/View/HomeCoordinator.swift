//
//  HomeCoordinator.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 02/08/22.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    
    init(_navigationControlller: UINavigationController) {
        self.navigationController = _navigationControlller
    }
    
    func start() {
        let homeVC = HomeVC.instantiate(storyboard: .home)
        homeVC.coordinator = self
        self.navigationController.pushViewController(homeVC, animated: true)
    }
    
    func homeDetails(data: HomeModel) {
        let child = HomeDetailsCoordinator(_navigationControlller: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.startWithData(model: data)
    }
    func nearByLocations() {
        let child = NearbyLocationsCoordinator(_navigationControlller: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
        
    }
    func logOut() {
        UIApplication.shared.setRootController(vc: .loginVC, stroybordName: .login)
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
