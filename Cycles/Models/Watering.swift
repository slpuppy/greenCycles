//
//  Watering.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation

struct Watering: Codable {
    
    let quantity: Float
    let date: Date
    let isFertirrigation: Bool
    let fertilization: [Fertilization]?
    
    enum CodingKeys: String, CodingKey {
        case quantity
        case date
        case isFertirrigation
        case fertilization
    }
    
}
