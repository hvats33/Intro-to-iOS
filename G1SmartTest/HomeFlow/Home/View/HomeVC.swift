//
//  HomeVC.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 02/08/22.
//

import UIKit

class HomeVC: UIViewController, CoordinatorBoard {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var tableView: HomeTableView!
    
    var coordinator: HomeCoordinator?
    private lazy var manager: HomeViewModel = {
       let vm = HomeViewModel()
        vm.delegate = self
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        if let nav = navigationController, coordinator == nil {
            coordinator = HomeCoordinator(_navigationControlller: nav)
        }
        registerCell()
        self.lblName.text = UD.fetchUserName()
        manager.getHomeData()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
    }
    @IBAction func logOutAction(_ sender: UIButton) {
        
        Alerts.alertWithComplitionAndCancel("Alert", message: "Are you sure you want to logout the app?", btnOkTitle: "Logout", btnCancelTitle: "Cancel") { value in
            if value {
                UD.removeAll()
                self.coordinator?.logOut()
            }
        }
    }
    
    @IBAction func nearbyLocationsActions(_ sender: UIButton) {
        coordinator?.nearByLocations()
    }
    
}
extension HomeVC: HomeViewModelDelegate {
    func getHomeDataWithSucess() {
        tableView.setTableView(arr: manager.list, delegate: self)
    }
    
    func getHomeDataWithError(message: String) {
        Alerts.alert(title: "Error", message: message)
    }
    
    
}
extension HomeVC: HomeTableViewDelegate {
    
    func didSelectTableView(data: HomeModel, indexPath: IndexPath) {
        coordinator?.homeDetails(data: data)
    }
    
}
