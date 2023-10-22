//
//  hacktx_swiftuiApp.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct hacktx_swiftuiApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authModel: AuthModel = AuthModel()
    @StateObject var dataManager: DataManager = DataManager()

    var body: some Scene {
        WindowGroup {
            if !authModel.isLoggedIn{
                OnBoardingView()
                    .environmentObject(authModel)
                    .environmentObject(dataManager)
            }else{
                TabView{
                    PersonalTab()
                        .tabItem {
                            Label("Personal", systemImage: "person.fill")
                        }
//                    CommunityTab()
//                        .tabItem {
//                            Label("Community", systemImage: "house")
//                        }
                    StatisticsTab()
                        .tabItem {
                            Label("Statistics", systemImage: "chart.pie")
                        }
                }
                .environmentObject(authModel)
                .environmentObject(dataManager)
                .onAppear{
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil{
                            authModel.currentUserEmail = user?.email ?? "no email"
                            dataManager.getUserByEmail(email: authModel.currentUserEmail){ user in
                                if let user = user{
                                    authModel.currentUserUserID = user.id.description
                                    authModel.currentUserUsername = user.username
                                    authModel.currentUserBio = user.bio
                                    authModel.currentUserCompanyID = user.companyID
                                }
                            }
                            authModel.isLoggedIn = true
                        }
                    }
                }
            }
        }
    }
}
