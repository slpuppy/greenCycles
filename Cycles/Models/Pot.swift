//
//  Pot.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation

struct Pot {
    
    enum PotMedium {
        case living, coco, hydroponic, supersoil, clay
    }
    let size: Float
    let soilMix: Dictionary<Int, String>?
}
