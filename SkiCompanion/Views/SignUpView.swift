//
//  SignUpView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 17/09/2021.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var state: StateController
    @State private var logIn = false
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: RootTabView()) {
                    Text("Sign Up")
                }
                Spacer()
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                }
            }
//        TextField(
//            "User name",
//            text: $username
//        )
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
