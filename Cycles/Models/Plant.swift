//
//  Plant.swift
//  Cycles
//
//  Created by Gabriel Puppi on 06/05/24.
//

import Foundation


struct Plant {
    
    enum BornType {
        case seed, clone
    }
    
    enum GeneticType {
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
    
}




    



