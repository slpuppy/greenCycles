//
//  Cycle.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation


class Cycle: Codable, JSONRepresentable, ObservableObject, Identifiable  {
   
    let startDate: Date
    let currentDate: Date
    let environment: Environment
    let plants: [Plant] = []
    
    
    enum CodingKeys: String, CodingKey {
        case startDate
        case currentDate
        case environment
        case plants
    }
    
}

