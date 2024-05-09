//
//  AuthManager.swift
//  Cycles
//
//  Created by Gabriel Puppi on 08/05/24.
//

import Foundation
import FirebaseAuth


class AuthManager: AuthProtocol {
    
    static let shared = AuthManager()
    
    let auth = Auth.auth()
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    private init() {
        
    }
    
    func signIn(email: String, password: String) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            auth.signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    if let result = result {
                        print(result)
                    }
                    continuation.resume()
                }
            }
        }
    }
    
    func signUp(email: String, password: String, username: String) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            auth.createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    if let result = result {
                        print(result)
                    }
                    continuation.resume()
                }
            }
        }
    }
    
    func sendPasswordReset(withEmail email: String) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            auth.sendPasswordReset(withEmail: email) { error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            }
        }
    }
    
    func deleteAccount() async throws {
        guard let user = auth.currentUser else {
            return
        }
        
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            user.delete { error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
    }

}
