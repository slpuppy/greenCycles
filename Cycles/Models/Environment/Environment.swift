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
    let ventilation: [ExhaustFan]
}

struct EnvironmentSize {
    let width1: Double
    let width2: Double
    let height: Double
}

struct ExhaustFan {
    let power: Int
    let flowRate: Float
}

