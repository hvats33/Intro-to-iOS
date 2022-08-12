//
//  HomeViewModel.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 02/08/22.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func getHomeDataWithSucess()
    func getHomeDataWithError(message: String)
}

class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    lazy var list: [HomeModel] = []
    
    func getHomeData() {
        guard let path = Bundle.main.path(forResource: "HomeJson", ofType: "json") else { return }

        let url = URL(fileURLWithPath: path)

        do {
            let data = try Data(contentsOf: url)
            let model = [HomeModel].parse(data: data) ?? []
            print(model)
            self.list = model
            delegate?.getHomeDataWithSucess()
        } catch {
            delegate?.getHomeDataWithError(message: error.localizedDescription)
        }
    }
    
}
