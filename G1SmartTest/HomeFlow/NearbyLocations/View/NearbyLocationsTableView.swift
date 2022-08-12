//
//  NearbyLocationsTableView.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 11/08/22.
//

import UIKit
protocol NearbyLocationsTableViewDelegate: AnyObject {
    func didSelectTableView(data: LocationModel, indexPath: IndexPath)
}
class NearbyLocationsTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    lazy var list: [LocationModel] = []
    weak var delegates: NearbyLocationsTableViewDelegate?
    
    func setTableView(arr: [LocationModel], delegate: NearbyLocationsTableViewDelegate?) {
        self.delegates = delegate
        self.dataSource = self
        self.delegate = self
        self.list = arr
        self.reloadWithAnimation(animationDirection: .left)
    }
    
    func updateValues(arr: [LocationModel]) {
        self.list = arr
        self.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NearbyLocationTVC") as? NearbyLocationTVC else {
            fatalError("Cell not found!")
        }
        cell.configureCell(data: list[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegates?.didSelectTableView(data: list[indexPath.row], indexPath: indexPath)
    }
}
