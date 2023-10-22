//
//  DataManager.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import Foundation
import Firebase

class DataManager: ObservableObject{

    //MARK: ADDING
    func addUser(id: UUID, email: String, username: String, companyIdentifier: Int){
        let db = Firestore.firestore()
        let ref = db.collection("User").document(id.uuidString)
        ref.setData(["id": id.description, "email" : email, "username": username, "companyID": companyIdentifier]){error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
    
    func addReport(id: UUID, rating: Double, goodThing: String, badThing: String, userID: String, companyID: Int){
        let db = Firestore.firestore()
        let ref = db.collection("Report").document(id.uuidString)
        ref.setData(["id": id.description, "date": FieldValue.serverTimestamp(), "goodThing": goodThing, "badThing": badThing, "rating": rating, "userID": userID, "companyID": companyID]){ error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: GETTING
    func getCompany(companyID: Int, completion: @escaping (Company?) -> Void) {
        let db = Firestore.firestore()
        db.collection("Company")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completion(nil) // Handle the error case
                } else {
                    print(querySnapshot!.documents)
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        let fetchedCompanyID = data["companyID"] as? Int ?? 1111
                        let name = data["name"] as? String ?? ""
                        let employees = self.fetchEmployees(companyID: companyID)
                        print(companyID)
                        if companyID == fetchedCompanyID{
                            let company = Company(id: companyID, name: name, employees: employees)
                            completion(company) // Return the user object when data is available
                            return
                        }
                    }
                    completion(nil) // Handle the case where no matching document is found
                }
            }
    }

    func getUser(userID: String, completion: @escaping (User?) -> Void) {
        let db = Firestore.firestore()
        db.collection("User")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completion(nil) // Handle the error case
                } else {
                    print(querySnapshot!.documents)
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        let fetchedID = data["id"] as? String ?? ""
                        let email = data["email"] as? String ?? ""
                        let username = data["username"] as? String ?? ""
                        let bio = data["bio"] as? String ?? ""
                        let companyID = data["companyID"] as? Int ?? 1111
                        
                        if userID == fetchedID{
                            let user = User(username: username, email: email, bio: bio, companyID: companyID)
                            completion(user) // Return the user object when data is available
                            return
                        }
                    }
                    completion(nil) // Handle the case where no matching document is found
                }
            }
    }
    
    
    func getUserByEmail(email: String, completion: @escaping (User?) -> Void) {
        let db = Firestore.firestore()
        db.collection("User")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completion(nil) // Handle the error case
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        
                        let fetchedEmail = data["email"] as? String ?? ""
                        let username = data["username"] as? String ?? ""
                        let bio = data["bio"] as? String ?? ""
                        let companyID = data["companyID"] as? Int ?? 1111
                                             
                        if email == fetchedEmail{
                            let user = User(username: username, email: email, bio: bio, companyID: companyID)
                            completion(user) // Return the user object when data is available
                            return
                        }
                    }
                    completion(nil) // Handle the case where no matching document is found
                }
            }
    }
    
    func fetchEmployees(companyID: Int) -> [String]{
        let db = Firestore.firestore()
        var employees: [String] = []
        db.collection("User")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        let fetchedCompanyID = data["companyID"] as? Int ?? -1
                        
                        let id = data["id"] as? String ?? ""
                        if companyID == fetchedCompanyID{
                            employees.append(id)
                        }
                    }
                }
            }
        return employees
    }


    
    func getPersonalLast30(userID: String) -> [Report] {
        let db = Firestore.firestore()
        var reports: [Report] = []
        getUser(userID: userID){ user in
            if let user = user {
                db.collection("Reports")
                    .getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in querySnapshot!.documents {
                                let data = document.data()
                                let fetchedUserID = data["userID"] as? String ?? ""
                                let timestamp: Timestamp = data["date"] as? Timestamp ?? Timestamp(date: Date.now)
                                let date = timestamp.dateValue()

                                let rating = data["rating"] as? Double ?? 0
//                                print(rating)
                                
                                if fetchedUserID == userID{
                                    let report = Report(date: date, userID: "", companyID: user.companyID, rating: rating, goodThing: "", badThing: "")
                                    reports.append(report)
                                }
                            }
                        }
                    }
            }
        }
//        print(userID)
//        print(reports)
        return reports
    }
    
    func getCompanyLast30(companyID: Int) -> [Report] {
        let db = Firestore.firestore()
        var reports: [Report] = []
        db.collection("Reports")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        let fetchedCompanyID = data["companyID"] as? Int ?? -1
                        let timestamp: Timestamp = data["date"] as? Timestamp ?? Timestamp(date: Date.now)
                        let date = timestamp.dateValue()
                        
                        let rating = data["rating"] as? Double ?? 0
//                        print(rating)
                        
                        if fetchedCompanyID == companyID{
                            let report = Report(date: date, userID: "", companyID: companyID, rating: rating, goodThing: "", badThing: "")
                            reports.append(report)
                        }
                    }
                }
            }
//        print(companyID)
//        print(reports)
        return reports
    }
}
