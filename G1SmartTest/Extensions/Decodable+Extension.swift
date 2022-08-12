//
//  Decodable+Extension.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 02/08/22.
//

import Foundation

extension Decodable {
    
    static func parse(data: Data) -> Self? {
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(self, from: data)
        } catch {
            return nil
        }
    }
    
}
