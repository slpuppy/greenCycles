//
//  Fertilizer.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation

struct Fertilizer: Codable {
    
    enum FertilizerType: String, Codable {
        case liquid, solid
    }
    
    let type: FertilizerType
    let name: String
    
}

