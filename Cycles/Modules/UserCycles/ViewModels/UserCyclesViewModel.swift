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
    
}
