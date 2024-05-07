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
    
    let auth = Auth.auth()
    let db = FirestoreManager.shared.db
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
        
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String, username: String){
        
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let result = result, error == nil else {
                print("Error signing up:", error?.localizedDescription ?? "Unknown error")
                return }
            
            DispatchQueue.main.async {
                print("Success")
                self?.signedIn = true
                
                let uid = result.user.uid
                
                self?.db.collection("userInfo").document(uid).setData( ["email": email, "uid": uid, "username" : username]) { (error) in
                    if let error = error {
                        print("Error saving user data:", error.localizedDescription)
                        return
                    }
                }
            }
        }
    }
    
    func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            callback?(error)
        }
    }
    
    
    func deleteAccount() {
        
        let user = auth.currentUser
        user?.delete { error in
          if let error = error {
            // An error happened.
              print(error)
        } else {
              self.signOut()
              print("sucessfull deleted")
          }
        }
        
    }
 
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
        
    }
}





