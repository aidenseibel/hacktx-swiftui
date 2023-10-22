//
//  OnBoardingView.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import SwiftUI
import ACarousel

struct OnBoardingView: View {
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0

    
    var body: some View {
        VStack(alignment: .center){
            VStack{
                Text("CrewNotes")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Text("Workplace Diaries")
                    .font(.body)
                    .foregroundColor(.white)
            }
            .padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
            .background(.blue)
            .cornerRadius(10)
            GeometryReader{ proxy in
                HStack(spacing: UIScreen.main.bounds.width*0.1){
                    LoginView()
                    SignupView()
                }
                .padding()
                .scrollIndicators(.hidden)
                .offset(x: offset)
                .offset(x: CGFloat(currentIndex) * UIScreen.main.bounds.width * -1.0)
                .gesture(
                    DragGesture()
                        .updating($offset, body: { value, out, _ in
                            out = value.translation.width
                        })
                        .onEnded({ value in
                            let endingOffset = value.translation.width
                            if endingOffset < UIScreen.main.bounds.width * -0.3 && currentIndex < 1{
                                currentIndex += 1
                            }else if endingOffset > UIScreen.main.bounds.width * 0.3 && currentIndex > 0{
                                currentIndex -= 1
                            }
                            
                        })
                )
            }
            .animation(.easeInOut, value: offset == 0)

        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
