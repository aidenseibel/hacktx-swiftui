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
                    Text("Company Statistics")
                    Text("TxDOT")
                        .font(.title)
                        .bold()
                    
                    Text("Last 30 Days")
                        .font(.title2)
                        .bold()
                    
                    Text("General Morale")
                        .font(.title3)
                        .bold()

                    Image("linechart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.90, height: UIScreen.main.bounds.width * 0.50)
                    
                    
                    Text("Good Things / Bad Things")
                        .font(.title3)
                        .bold()

                    HStack{
                        Image("piechart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.width * 0.50)
                        Spacer()
                        Image("piechart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.width * 0.50)
                    }
                    .padding(10)
                    
                    Group{
                        Text("Concerns Raised")
                            .font(.title3)
                            .bold()
                            .padding(.top)
                        Image("barchart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.90, height: UIScreen.main.bounds.width * 0.60)

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
