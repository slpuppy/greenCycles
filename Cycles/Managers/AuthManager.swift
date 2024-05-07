//
//  AuthManager.swift
//  Cycles
//
//  Created by Gabriel Puppi on 07/05/24.
//

import Foundation
import FirebaseAuth

class AuthManager {
    static let shared = AuthManager()
    
    var auth: Auth
    var currentUser: User? {
        return auth.currentUser
    }
    
    var isSignedIn: Bool {
        return currentUser != nil
    }
    
    private init() {
        auth = Auth.auth()
    }
}
