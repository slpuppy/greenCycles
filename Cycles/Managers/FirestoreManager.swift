//
//  FirestoreManager.swift
//  Cycles
//
//  Created by Gabriel Puppi on 07/05/24.
//

import Foundation
import FirebaseFirestore

class FirestoreManager {
    static let shared = FirestoreManager()
    
    let db: Firestore
    
    private init() {
        db = Firestore.firestore()
    }
}
