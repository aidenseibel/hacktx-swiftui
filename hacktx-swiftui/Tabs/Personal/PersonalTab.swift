//
//  PersonalTab.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import SwiftUI
import Charts
import FirebaseAuth

struct PersonalTab: View {
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var authModel: AuthModel
    
    @State var last30Personal: [Report] = []
    @State var last30Company: [Report] = []
    
    @State var sampleReports: [Report] = [
        Report(date: Date(timeIntervalSinceNow: -10), userID: "", companyID: 1111, rating: 0.6, goodThing: "", badThing: ""),
        Report(date: Date(timeIntervalSinceNow: -10000), userID: "", companyID: 1111, rating: 0.2, goodThing: "", badThing: ""),
        Report(date: Date(timeIntervalSinceNow: -200000), userID: "", companyID: 1111, rating: 0.8, goodThing: "", badThing: ""),
        Report(date: Date(timeIntervalSinceNow: -400000), userID: "", companyID: 1111, rating: 0.9, goodThing: "", badThing: ""),

    ]

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }()

    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 20){
                    HStack{
                        Text("How are you today?")
                            .font(.title2)
                            .bold()
                        Spacer()
                        Button {
                            do {
                                try Auth.auth().signOut()
                                authModel.resetToDefaults()
                            } catch {
                                print("Error signing out: \(error.localizedDescription)")
                            }
                        } label: {
                            Text("Log out")
                        }

                    }
                    HStack{
                        NavigationLink(destination: CreateReportView()) {
                            Text("Create today's report")
                                .lineLimit(1)
                                .minimumScaleFactor(0.50)
                                .padding(20)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        Spacer()
                        NavigationLink(destination: RaiseConcernView()) {
                            Text("Raise a concern")
                                .lineLimit(1)
                                .padding(20)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }

                    Text("Past 30 Days")
                        .font(.title)
                        .bold()

                    Group{
                        HStack{
                            Text("Recent Reports")
                                .font(.title2)
                                .bold()
                            Spacer()
                            NavigationLink(destination: AllReportsView(reports: sampleReports)) {
                                Text("See All")
                            }
                        }
                        ForEach(sampleReports[0..<3], id:\.self) { report in
                            HStack{
                                Text(String(format: "%.0f", report.rating * 10))
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .bold()
                                Text(dateFormatter.string(from: report.date))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding(5)
                            .background(.blue)
                            .cornerRadius(5)
                        }
                    }
                                        
                    Group{
                        HStack{
                            Text("General Morale")
                                .font(.title2)
                                .bold()
                            Spacer()
//                            Button {
//                                last30Personal = dataManager.getPersonalLast30(userID: authModel.currentUserUserID)
//                                last30Company = dataManager.getCompanyLast30(companyID: authModel.currentUserCompanyID)
//                                print(last30Personal)
//                                print(last30Company)
//                            } label: {
//                                Text("Click to load")
//                            }
                        }
                        Image("linechart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.90, height: UIScreen.main.bounds.width * 0.50)
                            .padding(10)
                            .background(.blue)
                            .cornerRadius(10)
                        Text("Morale has been on the rise across the last 30 days")
                    }
                    
                    Group{
                        Text("Good Things / Bad Things")
                            .font(.title2)
                            .bold()
                            .padding(.top)
                        HStack{
                            Image("piechart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.width * 0.40)
                                .clipped()
                                .cornerRadius(10)
                            Spacer()
                            Image("piechart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.width * 0.40)
                                .clipped()
                                .cornerRadius(10)
                        }
                        .padding(10)
                        .background(.blue)
                        .cornerRadius(10)
                        Text("Incident reporting shows a small lead in bad things.")
                    }
                    
                    Group{
                        Text("Concerns Raised")
                            .font(.title2)
                            .bold()
                            .padding(.top)
                        Image("barchart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.90, height: UIScreen.main.bounds.width * 0.60)
                            .padding(10)
                            .background(.blue)
                            .cornerRadius(10)
                        Text("Concerns peaked two weeks ago, and have steadily declined.")
                    }
                    Group{
                        Text("Settings")
                            .font(.title2)
                            .bold()
                            .padding(.top)
                        HStack{
                            NavigationLink(destination: CreateReportView()) {
                                Text("Change Company")
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.50)
                                    .padding(20)
                                    .background(.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            Spacer()
                            NavigationLink(destination: RaiseConcernView()) {
                                Text("Edit Reports")
                                    .lineLimit(1)
                                    .padding(20)
                                    .background(.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }

                    }
                }
                .padding(20)
            }
        }
    }
}

struct PersonalTab_Previews: PreviewProvider {
    static var previews: some View {
        PersonalTab()
    }
}
