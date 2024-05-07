//
//  Pot.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation

struct Pot: Codable {
    
    enum PotMedium: String, Codable {
        case living, coco, hydroponic, supersoil, clay
    }
    
    let medium: PotMedium
    let size: Float
    let soilMix: Dictionary<Int, String>?
    
    enum CodingKeys: String, CodingKey {
        case medium
        case size
        case soilMix
    }
}
