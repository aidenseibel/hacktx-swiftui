//
//  AllReportsview.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/22/23.
//

import SwiftUI

struct AllReportsView: View {
    var reports: [Report]
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }()

    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("All Reports")
                    .font(.title)
                    .bold()
                ForEach(reports, id:\.self) { report in
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
            .padding(20)
        }
    }
}

struct AllReportsview_Previews: PreviewProvider {
    static var previews: some View {
        AllReportsView(reports: [])
    }
}
