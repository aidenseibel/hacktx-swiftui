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
                VStack(alignment: .leading){
                    Text("Company Statistics")
                    Text("<CompanyName>")
                        .font(.title)
                        .bold()
                    
                    Text("Last 30 Days")
                        .font(.title)
                        .bold()
                    
//                    Chart{
//                        ForEach(last30Personal, id: \.id){ report in
//                            LineMark(
//                                x: .value("Date", report.date),
//                                y: .value("Rating", report.rating),
//                                series: .value("Company", "A")
//                            )
//                            .foregroundStyle(.blue)
//                        }
//                        ForEach(last30Company, id: \.id){ report in
//                            LineMark(
//                                x: .value("Date", report.date),
//                                y: .value("Rating", report.rating),
//                                series: .value("Company", "A")
//                            )
//                            .foregroundStyle(.red)
//                        }
//                    }
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
