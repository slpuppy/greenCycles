//
//  AuthProtocol.swift
//  Cycles
//
//  Created by Gabriel Puppi on 08/05/24.
//

import Foundation

protocol AuthProtocol {
    var isSignedIn: Bool { get }
    func signIn(email: String, password: String) async throws
    func signUp(email: String, password: String, username: String) async throws
    func sendPasswordReset(withEmail email: String) async throws
    func deleteAccount() async throws 
    func signOut()
}
