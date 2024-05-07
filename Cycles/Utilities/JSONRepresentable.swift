//
//  JSONRepresentable.swift
//  Cycles
//
//  Created by Gabriel Puppi on 07/05/24.
//

import Foundation


protocol JSONRepresentable {

}

extension JSONRepresentable where Self: Encodable, Self: Decodable {
    
    func asJson() throws -> [String: Any] {
        
        let encoded = try JSONEncoder().encode(self)
        let decoded = try JSONSerialization.jsonObject(with: encoded, options: [])
        return decoded as! [String: Any]
        
        }
}
