//
//  Ventilation.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation

struct Ventilation: Codable {
    
    enum VentilationType: String, Codable {
        case exhaust, insideFan
    }
    
    let power: Int
    let flowRate: Float
    let type: VentilationType
    
    enum CodingKeys: String, CodingKey {
        case power
        case flowRate
        case type
    }
}

