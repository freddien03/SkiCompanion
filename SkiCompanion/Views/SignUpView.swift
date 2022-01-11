//
//  SignUpView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 17/09/2021.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State var username: String = ""
    @State var password: String = ""
    @EnvironmentObject var state: StateController
    @State private var loggedIn = false
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: RootTabView(), isActive: $loggedIn) { EmptyView() }
                
                Text("Sign Up")
                    .font(.system(size: 30, weight: .semibold))
                HStack{
                    Image(systemName: "envelope").foregroundColor(.gray)
                    TextField("Email", text: $username)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                }
                HStack{
                    Image(systemName: "lock").foregroundColor(.gray)
                    SecureField("Password", text: $password)
                }
                Button("Create Account"){
                    Auth.auth().createUser(withEmail: username, password: password) { (result, error) in
                        if let error = error{
                            print(error.localizedDescription)
                        } else {
                            loggedIn = true
                            state.getStarterAchievements() { results in
                                switch results {
                                    case .failure(let error):
                                        print(error.localizedDescription)
                                    state.currentUser = User(email: username, password: password, currentResort: "Verbier", achievements: [])
                                case .success(let ach):
                                    state.currentUser = User(email: username, password: password, currentResort: "Verbier", achievements: ach)
                                }
                            }
                        }
                    }
                }
                .padding()
//                NavigationLink(destination: LoginView()) {
//                    Text("Log In")
//                }
                Button("Log In") {
                    Auth.auth().signIn(withEmail: username, password: password){ (result, error) in
                        if error != nil {
                            print(error?.localizedDescription ?? "")
                        } else {
                            loggedIn = true
                            state.UserID = Auth.auth().currentUser?.uid ?? ""
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
//        .onAppear(perform: {
//            if Auth.auth().currentUser != nil {
//                loggedIn = true
//                state.UserID = Auth.auth().currentUser?.uid ?? ""
//            }
//        })
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
