//
//  FirestoreManager.swift
//  Cycles
//
//  Created by Gabriel Puppi on 07/05/24.
//

import Foundation
import FirebaseFirestore

class DBManager: DBManagerProtocol {
  
    static let shared = DBManager()
    
    let db = Firestore.firestore()
    
    private init() {
       
    }
    
    func getUserCycles() async throws -> [Cycle]? {
        guard let id = AuthManager.shared.auth.currentUser?.uid else { return nil }
        let querySnapshot = try await db.collection("userInfo").document(id).collection("cycles").getDocuments()
         let cycles = querySnapshot.documents.compactMap { document -> Cycle? in
             try? document.data(as: Cycle.self)
         }
        return cycles
     }
    
    func createNewCycle(cycle: Cycle) async throws {
        do {
            guard let id = AuthManager.shared.auth.currentUser?.uid else {
                throw NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "User not authenticated"])
            }
            
            let userRef = db.collection("userInfo").document(id)
            let docRef = userRef.collection("cycles").document()
            let cycleId = docRef.documentID
            cycle.updateID(id: cycleId)
            
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601 // Set the date encoding strategy to .iso8601
            
            let cycleData = try encoder.encode(cycle)
            guard let cycleDict = try JSONSerialization.jsonObject(with: cycleData, options: []) as? [String: Any] else {
                throw NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to encode cycle"])
            }
            
            try await userRef.collection("cycles").document(cycleId).setData(cycleDict)
            print("Cycle written to database successfully")
        } catch {
            print("Failed to write cycle to database:", error.localizedDescription)
            throw error
        }
    }

    
    func saveUser(email: String, username: String, id: String) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            self.db.collection("userInfo").document(id).setData([
                "email": email,
                "uid": id,
                "username" : username
            ]) { error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            }
        }
    }

}
