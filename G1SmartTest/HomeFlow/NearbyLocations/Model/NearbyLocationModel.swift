//
//  NearbyLocationModel.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 11/08/22.
//

import Foundation

struct LocationModel: Decodable {
    
    
    let id: String?
    let title: String?
    let lat: String?
    let lng: String?
    let timeDistance: String?
    
    enum codingKeys: String, CodingKey {
        case id, title, lat, lng
        case timeDistance = "Time/Distance"
    }
    
    init(from decoder: Decoder) throws {
        let value = try? decoder.container(keyedBy: codingKeys.self)
        
        self.timeDistance = try? value?.decode(String.self, forKey: .timeDistance)
        self.id = try? value?.decode(String.self, forKey: .id)
        self.title = try? value?.decode(String.self, forKey: .title)
        self.lat = try? value?.decode(String.self, forKey: .lat)
        self.lng = try? value?.decode(String.self, forKey: .lng)
    }
    
}
