//
//  AuthViewModel.swift
//  Cycles
//
//  Created by Gabriel Puppi on 07/05/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    
    var auth: AuthProtocol?
    var dbManager: DBManagerProtocol?
    
    @Published var signedIn = false
    
    func setup(auth: AuthProtocol = AuthManager.shared, db: DBManagerProtocol = DBManager.shared){
        self.auth = auth
        self.dbManager = db
        signedIn = auth.isSignedIn
    }
    
    func signIn(email: String, password: String) async {
        do {
            try await auth?.signIn(email: email, password: password)
            DispatchQueue.main.async {
                self.signedIn = true
            }
        } catch {
            // Handle error, e.g., show an alert to the user
            print("Failed to sign in:", error)
        }
    }
    
    func signUp(email: String, password: String, username: String) async {
        do {
            try await auth?.signUp(email: email, password: password, username: username)
            DispatchQueue.main.async {
                self.signedIn = true
            }
            
            if let id = AuthManager.shared.auth.currentUser?.uid {
                try await DBManager.shared.saveUser(email: email, username: username, id: id)
            }
        } catch {
            // Handle error, e.g., show an alert to the user
            print("Failed to sign up:", error)
        }
    }
    
    
    func sendPasswordReset(withEmail email: String) async {
        do {
            try await auth?.sendPasswordReset(withEmail: email)
            // Password reset email sent successfully
        } catch {
            // Handle error, e.g., show an alert to the user
            print("Failed to send password reset:", error)
        }
    }
    
    
    func deleteAccount() async {
        do {
            try await auth?.deleteAccount()
            // Account deleted successfully
        } catch {
            // Handle error, e.g., show an alert to the user
            print("Failed to delete account:", error)
        }
    }
    
    
    func signOut() {
        auth?.signOut()
        self.signedIn = false
    }
    
}





