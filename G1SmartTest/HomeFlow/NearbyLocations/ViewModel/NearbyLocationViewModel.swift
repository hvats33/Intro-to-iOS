//
//  NearbyLocationViewModel.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 11/08/22.
//

import Foundation

protocol NearbyLocationViewModelDelegate: AnyObject {
    func getCoordinatesWithSucess()
    func getCoordinatesWithError(message: String)
}

class NearbyLocationViewModel {
    
    weak var delegate: NearbyLocationViewModelDelegate?
    lazy var coordinates: [LocationModel] = []
    
    init(_delegate: NearbyLocationViewModelDelegate) {
        self.delegate = _delegate
    }
    
    func getCoordinates() {
        guard let path = Bundle.main.path(forResource: "Coordinates", ofType: "json") else { return }

        let url = URL(fileURLWithPath: path)

        do {
            let data = try Data(contentsOf: url)
            let model = [LocationModel].parse(data: data) ?? []
            print(model)
            self.coordinates = model
            delegate?.getCoordinatesWithSucess()
        } catch {
            delegate?.getCoordinatesWithError(message: error.localizedDescription)
        }
    }
    
}
