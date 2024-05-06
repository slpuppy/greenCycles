//
//  Ilumination.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation

import Foundation

struct Ilumination {
    
    enum IluminationType {
        case CFL, COB_LED, HPS, LED, MH, QB_LED, SUN
    }
    
    struct Light {
        
        let type: IluminationType
        let power: Int
        var quantity: Int
    }
    
    let lights: [Light]
}
