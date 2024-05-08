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
    
    private var auth = Auth.auth()
    private var db = FirestoreManager.shared.db
    
    func fetchUserCycles(){
        if let id = auth.currentUser?.uid {
            db.collection("userInfo").document(id)
                        .collection("cycles").addSnapshotListener { (querySnapshot, error) in
                
                guard let documents = querySnapshot?.documents else {
                    print("No Cycles")
                    return
               }
               self.cycles =  documents.compactMap { (queryDocumentSnapshot) -> Cycle? in
                   return try? queryDocumentSnapshot.data(as: Cycle.self)
               }
                
            }
        }
    }
    
    func createNewCycle(){
        
        let lights = [Ilumination.Light(type: .LED, power: 120, quantity: 1)]
        let ilumination = Ilumination(lights: lights)
        let ventilation = [Ventilation(power: 27, flowRate: 360, type: .exhaust)]
        let environmentSize = EnvironmentSize(width1: 60, width2: 60, height: 140)
        let environment = Environment(type: .indoor, dimensions: environmentSize, ilumination: ilumination, ventilation: ventilation)
        
        
        do {
            if let id = auth.currentUser?.uid{
                let userRef = db.collection("userInfo").document(id)
                let docRef = userRef.collection("cycles").document()
                let id = docRef.documentID
               
                let cycle = Cycle(name: "CBD Auto",cycleID: id ,startDate: Date(), environment: environment)
                
                try userRef.collection("cycles").document(id).setData(from: cycle) { error in
                    if let error {
                        print(error.localizedDescription)
                    } else {
                        print ("sucess writting cycle: \(id)")
                    }
                }
              }
            } catch {
                print("error writing object")
            }
        }
        
    }
    

