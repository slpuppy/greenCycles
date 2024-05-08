//
//  Cycle.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation
import FirebaseFirestore


class Cycle: Codable, JSONRepresentable, ObservableObject, Identifiable  {
    
    init(name: String, cycleID: String? = nil, startDate: Date, environment: Environment, plants: [Plant]? = nil) {
        self.name = name
        self.cycleID = cycleID
        self.startDate = startDate
        self.environment = environment
        self.plants = plants
    }
    
    let name: String
    @DocumentID var docID: String?
    let cycleID: String?
    let startDate: Date
    let environment: Environment
    var plants: [Plant]?
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case cycleID
        case startDate
        case environment
        case plants
    }
    
    
    
    func addPlant(plants:[Plant]){
        self.plants?.append(contentsOf: plants)
    }
    
}

