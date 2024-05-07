//
//  Environment.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation


class Environment: Codable, JSONRepresentable, ObservableObject, Identifiable  {
    
    internal init(type: EnvironmentType, dimensions: EnvironmentSize, ilumination: [Ilumination], ventilation: [Ventilation]?) {
        self.type = type
        self.dimensions = dimensions
        self.ilumination = ilumination
        self.ventilation = ventilation
    }
    
    enum EnvironmentType: String, Codable {
        case outdoor, indoor
    }
    
    let type: EnvironmentType
    let dimensions: EnvironmentSize
    let ilumination: [Ilumination]
    let ventilation: [Ventilation]?
    
    enum CodingKeys: String, CodingKey {
        case type
        case dimensions
        case ilumination
        case ventilation
    }
}
