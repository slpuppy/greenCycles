//
//  Plant.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation


struct Plant: Codable {
    
    enum BornType: String, Codable {
        case seed, clone
    }
    
    enum GeneticType: String, Codable {
        case photoperiodic, automatic, unknown
    }
    
    let name: String
    let seedbank: String?
    let age: Int?
    let geneticType: GeneticType?
    let bornType: BornType
    let pot: Pot
    let germinationDate: Date?
    let vegStartDate: Date?
    let flowerStartDate: Date?
    let harvestDate: Date?
    let wateringSchedule: [Watering]?
    let fertilizationSchedule: [Fertilization]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case seedbank
        case age
        case geneticType
        case bornType
        case pot
        case germinationDate
        case vegStartDate
        case flowerStartDate
        case harvestDate
        case wateringSchedule
        case fertilizationSchedule
    }
    
}




    



