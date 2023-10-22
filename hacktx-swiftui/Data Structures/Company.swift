//
//  company.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import Foundation

struct Company: Identifiable, Hashable, Equatable{
    static func == (lhs: Company, rhs: Company) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: Int
    var name: String
    var employees: [String]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
