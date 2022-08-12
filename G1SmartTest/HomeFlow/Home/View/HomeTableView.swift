//
//  HomeTableView.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 02/08/22.
//

import UIKit

protocol HomeTableViewDelegate: AnyObject {
    func didSelectTableView(data: HomeModel, indexPath: IndexPath)
}

class HomeTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    lazy var list: [HomeModel] = []
    weak var delegates: HomeTableViewDelegate?
    
    func setTableView(arr: [HomeModel], delegate: HomeTableViewDelegate?) {
        self.delegates = delegate
        self.dataSource = self
        self.delegate = self
        self.list = arr
        self.reloadWithAnimation(animationDirection: .down)
    }
    
    func updateValues(arr: [HomeModel]) {
        self.list = arr
        self.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell else {
            fatalError("Cell not found!")
        }
        cell.setUI(data: list[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegates?.didSelectTableView(data: list[indexPath.row], indexPath: indexPath)
    }
}
