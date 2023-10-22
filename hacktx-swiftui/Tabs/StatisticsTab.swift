//
//  StatisticsTab.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import SwiftUI
import Charts

struct StatisticsTab: View {
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var authModel: AuthModel

    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing: 20){
                    Text("TxDOT")
                        .font(.title)
                        .bold()
                    
                    Text("Today's reports")
                        .font(.title2)
                        .bold()
                    
                    HStack{
                        VStack{
                            Text("550")
                                .bold()
                                .foregroundColor(.white)
                            Text("reports in")
                                .lineLimit(1)
                                .minimumScaleFactor(0.50)
                                .foregroundColor(.white)
                        }
                        .padding(10)
                        .background(.blue)
                        .cornerRadius(10)
                        Spacer()
                        VStack{
                            Text("122")
                                .bold()
                                .foregroundColor(.white)
                            Text("good things")
                                .lineLimit(1)
                                .minimumScaleFactor(0.50)
                                .foregroundColor(.white)
                        }
                        .padding(10)
                        .background(.blue)
                        .cornerRadius(10)
                        Spacer()
                        VStack{
                            Text("12")
                                .bold()
                                .foregroundColor(.white)
                            Text("concerns")
                                .lineLimit(1)
                                .minimumScaleFactor(0.50)
                                .foregroundColor(.white)
                        }
                        .padding(10)
                        .background(.blue)
                        .cornerRadius(10)

                    }
                    

                    Text("Last 30 Days")
                        .font(.title2)
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
                }
                .padding(20)
            }
        }
    }
}

struct StatisticsTab_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsTab()
    }
}
