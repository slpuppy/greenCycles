//
//  Environment.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation


struct Environment {
    
    enum EnvironmentType {
        case outdoor, indoor
    }
    
    let type: EnvironmentType
    let dimensions: EnvironmentSize
    let ilumination: [Ilumination]
    let ventilation: [Ventilation]?
}
