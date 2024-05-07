//
//  Fertilization.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation

struct Fertilization: Codable {
    
    let fertilizer: Fertilizer
    let quantity: Float
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case fertilizer
        case quantity
        case date
    }
    
}
