//
//  Ilumination.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation

struct Ilumination: Codable {
    
    enum IluminationType: String, Codable {
        case CFL, COB_LED, HPS, LED, MH, QB_LED, SUN
    }
    
    struct Light: Codable {
        let type: IluminationType
        let power: Int?
        var quantity: Int?
        
        enum CodingKeys: String, CodingKey {
            case type
            case power
            case quantity
        }
    }
    
    let lights: [Light]
    
    enum CodingKeys: String, CodingKey {
        case lights
    }
    
 
}
