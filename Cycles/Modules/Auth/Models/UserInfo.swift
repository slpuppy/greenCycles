//
//  User.swift
//  Cycles
//
//  Created by Gabriel Puppi on 07/05/24.
//

import Foundation
import FirebaseFirestore


class UserInfo: Identifiable, Codable, ObservableObject {
    
    internal init(name: String?, userID: String? = nil, email: String?, username: String?, sign_up_at: Date, cycles: [Cycle]?) {
        self.name = name
        self.userID = userID
        self.email = email
        self.username = username
        self.sign_up_at = sign_up_at
        self.cycles = cycles
    }
    
    let name: String?
    @DocumentID var userID: String?
    let email: String?
    let username: String?
    let sign_up_at: Date
    let cycles:[Cycle]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case userID
        case email
        case username
        case sign_up_at
        case cycles
    }
    
}
