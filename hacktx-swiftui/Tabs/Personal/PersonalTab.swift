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
                            Spacer()
                            Image("piechart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.width * 0.40)
                        }
                        .padding(10)
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
                        Text("Concerns peaked two weeks ago, and have steadily declined.")
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
