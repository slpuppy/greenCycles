//
//  UserCyclesViewModel.swift
//  Cycles
//
//  Created by Gabriel Puppi on 07/05/24.
//

import Foundation
import FirebaseAuth


class UserCyclesViewModel: ObservableObject {
    
    @Published var cycles = [Cycle]()
    
    private var auth: AuthProtocol?
    private var dbManager: DBManagerProtocol?
    
    func setup(auth: AuthProtocol = AuthManager.shared, db: DBManagerProtocol = DBManager.shared){
        self.auth = auth
        self.dbManager = db
    }
    
    func fetchUserCycles() {
        Task {
            do {
                if let cycles = try await dbManager?.getUserCycles() {
                    DispatchQueue.main.async {
                        self.cycles = cycles
                        print("cycles fetched")
                    }
                } else {
                    // Handle case where cycles is nil
                    print("No cycles found")
                }
            } catch {
                print("Failed to fetch user cycles:", error)
            }
        }
    }
    
    func createNewCycle() {
        let lights = [Ilumination.Light(type: .LED, power: 120, quantity: 1)]
        let ilumination = Ilumination(lights: lights)
        let ventilation = [Ventilation(power: 27, flowRate: 360, type: .exhaust)]
        let environmentSize = EnvironmentSize(width1: 60, width2: 60, height: 140)
        let environment = Environment(type: .indoor, dimensions: environmentSize, ilumination: ilumination, ventilation: ventilation)
        
        let cycle = Cycle(name: "CBD Auto", cycleID: nil, creationDate: Date(), environment: environment)
        
        Task {
            do {
                try await DBManager.shared.createNewCycle(cycle: cycle)
                DispatchQueue.main.async {
                    self.fetchUserCycles()
                }
            } catch {
                // Handle error
            }
        }
    }
    
}


