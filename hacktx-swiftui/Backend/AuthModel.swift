//
//  AuthModel.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import Foundation

class AuthModel: ObservableObject{
    @Published var isLoggedIn: Bool = false
    
    @Published var currentUserUserID: String = ""
    @Published var currentUserEmail: String = ""
    @Published var currentUserUsername: String = ""
    @Published var currentUserBio: String = ""
    @Published var currentUserCompanyID: Int = 1111

}
