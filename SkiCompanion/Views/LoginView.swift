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
        VStack{
            Text("Log In")
                .font(.system(size: 30, weight: .semibold))
            HStack{
                Image(systemName: "envelope").foregroundColor(.gray)
                TextField("Email", text: $email)
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
                    }
                }
            }
            .padding()
        }
        .navigate(to: RootTabView(), when: $success)
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
