//
//  OnBoardingView.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import SwiftUI
import ACarousel

struct OnBoardingView: View {
    @State var index = 0
    
    var body: some View {
        VStack(alignment: .center){
            Text("CrewNotes")
                .font(.title)
                .bold()
            Text("A Community For Construction")
                .font(.body)
            ScrollView(.horizontal) {
                HStack{
                    LoginView()
                    SignupView()
                }
            }
            .padding()
            .scrollIndicators(.hidden)
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
