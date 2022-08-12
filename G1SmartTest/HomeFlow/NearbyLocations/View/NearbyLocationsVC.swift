//
//  NearbyLocationsVC.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 11/08/22.
//

import UIKit

class NearbyLocationsVC: UIViewController, CoordinatorBoard {
    
    @IBOutlet weak var tableView: NearbyLocationsTableView!
    
    var coordinator: NearbyLocationsCoordinator?
    private lazy var manager: NearbyLocationViewModel = {
        let vm = NearbyLocationViewModel(_delegate: self)
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        coordinator?.didFinishingNearbyLocations()
    }
    
    private func setUI() {
        registerCell()
        manager.getCoordinates()
    }
    private func registerCell() {
        let nib = UINib(nibName: "NearbyLocationTVC", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NearbyLocationTVC")
    }
    func openGoogleMap(model: LocationModel) {
        guard let lat = model.lat, let latDouble =  Double(lat) else { return }
        guard let long = model.lng, let longDouble =  Double(long) else { return }
        
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {  //if phone has an app
            
            if let url = URL(string: "comgooglemaps-x-callback://?saddr=&daddr=\(latDouble),\(longDouble)&directionsmode=driving") {
                UIApplication.shared.open(url, options: [:])
            }}
        else {
            //Open in browser
            if let urlDestination = URL.init(string: "https://www.google.co.in/maps/dir/?saddr=&daddr=\(latDouble),\(longDouble)&directionsmode=driving") {
                UIApplication.shared.open(urlDestination)
            }
        }
    }
    @IBAction func backAction(_ sender: UIButton) {
        coordinator?.back()
    }
}
extension NearbyLocationsVC: NearbyLocationViewModelDelegate {
    func getCoordinatesWithSucess() {
        tableView.setTableView(arr: manager.coordinates, delegate: self)
    }
    
    func getCoordinatesWithError(message: String) {
        Alerts.alert(title: "Error", message: message)
    }
}
extension NearbyLocationsVC: NearbyLocationsTableViewDelegate {
    func didSelectTableView(data: LocationModel, indexPath: IndexPath) {
        openGoogleMap(model: data)
    }
}
