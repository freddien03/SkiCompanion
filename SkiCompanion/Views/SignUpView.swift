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
        VStack{
            Text("Sign Up")
                .font(.system(size: 30, weight: .semibold))
            HStack{
                Image(systemName: "envelope").foregroundColor(.gray)
                TextField("Email", text: $username)
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
                        print("Success")
                        loggedIn.toggle()
                    }
                }
            }
            .padding()
            NavigationLink(destination: LoginView()) {
                Text("Log In")
            }
            .padding()
        }
        .navigate(to: RootTabView(), when: $loggedIn)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
