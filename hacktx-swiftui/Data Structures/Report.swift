//
//  Report.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import Foundation

struct Report: Identifiable, Hashable, Equatable{
    static func == (lhs: Report, rhs: Report) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var date: Date
    var userID: String
    var companyID: Int
    var rating: Double
    var goodThing: String
    var badThing: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
