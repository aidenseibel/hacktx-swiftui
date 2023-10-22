//
//  PersonalTab.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import SwiftUI
import Charts

struct PersonalTab: View {
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var authModel: AuthModel
    
    @State var last30Personal: [Report] = []
    @State var last30Company: [Report] = []
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 20){
                    Text("How are you today?")
                        .font(.title2)
                        .bold()
                    
                    NavigationLink(destination: CreateReportView()) {
                        Text("Create today's report")
                            .padding(20)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    Text("Past 30 Days")
                        .font(.title)
                        .bold()
                                        
                    Group{
                        HStack{
                            Text("General Morale")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Button {
                                last30Personal = dataManager.getPersonalLast30(userID: authModel.currentUserUserID)
                                last30Company = dataManager.getCompanyLast30(companyID: authModel.currentUserCompanyID)
                                print(last30Personal)
                                print(last30Company)
                            } label: {
                                Text("Click to load")
                            }
                        }
                        Chart{
                            ForEach(last30Personal, id: \.id){ report in
                                LineMark(
                                    x: .value("Date", report.date),
                                    y: .value("Rating", report.rating),
                                    series: .value("Company", "A")
                                )
                                .foregroundStyle(.blue)
                            }
                            ForEach(last30Company, id: \.id){ report in
                                LineMark(
                                    x: .value("Date", report.date),
                                    y: .value("Rating", report.rating),
                                    series: .value("Company", "A")
                                )
                                .foregroundStyle(.red)
                            }
                        }
                    }
                    
                    Group{
                        Text("Good Things / Bad Things")
                            .font(.title2)
                            .bold()
                        
//                        Chart(data, id: \.category) { item in
//                            BarMark(
//                                x: .value("Category", item.category),
//                                y: .value("Value", item.value)
//                            )
//                        }
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
