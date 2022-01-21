//
//  LoginView.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 01/10/2021.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State private var success = false
    @EnvironmentObject var state: StateController
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: RootTabView(loggedIn: $success), isActive: $success) { EmptyView() }
                
                Text("Log In")
                    .font(.system(size: 30, weight: .semibold))
                HStack{
                    Image(systemName: "envelope").foregroundColor(.gray)
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                }
                HStack{
                    Image(systemName: "lock").foregroundColor(.gray)
                    SecureField("Password", text: $password)
                }
                Button("Log In") {
                    Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
                        if error != nil {
                            print(error?.localizedDescription ?? "")
                        } else {
                            print("success")
                            success = true
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
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
