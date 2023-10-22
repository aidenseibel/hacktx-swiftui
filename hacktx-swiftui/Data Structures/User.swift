//
//  user.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import Foundation

struct User: Identifiable, Hashable, Equatable{
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    
    var username, email, bio: String
    var companyID: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
