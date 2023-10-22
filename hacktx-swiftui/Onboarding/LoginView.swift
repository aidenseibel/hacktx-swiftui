//
//  LoginView.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject var authModel: AuthModel
    @EnvironmentObject var dataManager: DataManager

    var body: some View {
        VStack{
            Text("Log in")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            Text("Swipe right to sign up")
                .foregroundColor(.white)
            
            VStack{
                TextField("email", text: $email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
                    .disableAutocorrection(true)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                SecureField("password", text: $password)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .disableAutocorrection(true)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                
                //MARK: SUBMIT BUTTON
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {return}
                    
                    login(email: email, password: password, authModel: authModel)
                    
                }, label: {
                    HStack(alignment: .center, spacing: 0){
                        Spacer()
                        Text("submit")
                           .foregroundColor(.white)
                           .bold()
                           .padding()
                        Spacer()
                    }
                    .background(.blue)
                    .cornerRadius(15)
                })
            }
            .padding(10)
            .background(.white)
            .cornerRadius(10)
            .padding(20)
        }
        .frame(width: UIScreen.main.bounds.width * 0.90, height: UIScreen.main.bounds.width * 0.90)
        .background(.blue)
        .cornerRadius(10)
    }
    
    func login(email: String, password: String, authModel: AuthModel){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }else{
                authModel.isLoggedIn = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
