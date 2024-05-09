//
//  Cycle.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation
import FirebaseFirestore


class Cycle: Codable, JSONRepresentable, ObservableObject, Identifiable  {
    
    init(name: String, cycleID: String? = nil, creationDate: Date, environment: Environment, plants: [Plant]? = nil) {
        self.name = name
        self.cycleID = cycleID
        self.creationDate = creationDate
        self.environment = environment
        self.plants = plants
    }
    
    let name: String
    @DocumentID var docID: String?
    var cycleID: String?
    let creationDate: Date
    let environment: Environment
    var plants: [Plant]?
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case cycleID
        case creationDate
        case environment
        case plants
    }
    
    func updateID(id: String) {
        self.cycleID = id
    }
    
    func addPlant(plants:[Plant]){
        self.plants?.append(contentsOf: plants)
    }
    
    func getPlants() -> [Plant]? {
        if let plants = self.plants {
            if !plants.isEmpty {
                return plants
            } else {
                print("No Plants")
                return nil
            }
      } else {
            print("var plants is nil")
            return nil
        }
    }
    
    func getDays() {
       
    }
    
    
}

