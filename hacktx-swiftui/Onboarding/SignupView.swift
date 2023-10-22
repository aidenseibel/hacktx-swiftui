//
//  SignupView.swift
//  hacktx-swiftui
//
//  Created by Aiden Seibel on 10/21/23.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State private var confirmPassword: String = ""
    @State var companyIdentifier: String = ""
    
    @EnvironmentObject var authModel: AuthModel
    @EnvironmentObject var dataManager: DataManager

    var body: some View {
        VStack{
            Text("Sign up")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 10){
                TextField("email", text: $email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                    .disableAutocorrection(true)
                TextField("username", text: $username)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                    .disableAutocorrection(true)
                TextField("company identifier", text: $companyIdentifier)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                    .disableAutocorrection(true)
                SecureField("password", text: $password)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                SecureField("confirm password", text: $confirmPassword)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                
                //MARK: SUBMIT BUTTON
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty, password == confirmPassword else {return}
                    signup(email: email, username: username, password: password, authModel: authModel, companyIdentifier: toDigit(str: companyIdentifier))
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
        .frame(width: UIScreen.main.bounds.width * 0.90, height: UIScreen.main.bounds.width * 1.30)
        .background(.blue)
        .cornerRadius(10)
        
    }
    
    func signup(email: String, username: String, password: String, authModel: AuthModel, companyIdentifier: Int){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }else{
                dataManager.addUser(id: UUID(), email: email, username: username, companyIdentifier: companyIdentifier)
                authModel.isLoggedIn = true
            }
        }
    }
    func toDigit(str: String) -> Int{
        if let intValue = Int(str){
            return intValue
        }
        return 1111
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
