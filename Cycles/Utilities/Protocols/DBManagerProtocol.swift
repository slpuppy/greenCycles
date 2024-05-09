//
//  DBProtocol.swift
//  Cycles
//
//  Created by Gabriel Puppi on 08/05/24.
//

import Foundation


protocol DBManagerProtocol {
    func saveUser(email: String, username: String, id: String) async throws
    func getUserCycles() async throws -> [Cycle]? 
}
