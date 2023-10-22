//
//  CreateReportView.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import SwiftUI

struct CreateReportView: View {
    @State private var sliderValue: Double = 0.5
    
    @State var goodThingText: String = ""
    @State var badThingText: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var authModel: AuthModel
    
    var body: some View {
        VStack(alignment: .leading){
            Group{
                HStack{
                    Text("Today's Report")
                        .bold()
                        .font(.title)
                    Spacer()
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Back")
                    }

                }
                Spacer()
                Text("How was your day at work?")
                    .bold()
                    .font(.title2)
                Slider(value: $sliderValue, in: 0.0...1.0, step: 0.01)
                    .padding()
                HStack{
                    Text("Bad")
                    Spacer()
                    Text("Good")
                }
            }
            Group{
                Spacer()
                Text("Mention a good thing at work")
                    .bold()
                    .font(.title2)
                TextField("Optional. Click to type...", text: $goodThingText)
                Spacer()
                Text("Mention a bad thing at work")
                    .bold()
                    .font(.title2)

                TextField("Optional. Click to type...", text: $badThingText)
                Spacer()
            }
            
            Group{
                Button {
                    dataManager.addReport(id: UUID(), rating: Double(sliderValue), goodThing: goodThingText, badThing: badThingText, userID: authModel.currentUserUserID, companyID: authModel.currentUserCompanyID)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Submit")
                }
            }
        }
        .padding(20)
        .navigationBarHidden(true)
    }
}

struct CreateReportView_Previews: PreviewProvider {
    static var previews: some View {
        CreateReportView()
    }
}
