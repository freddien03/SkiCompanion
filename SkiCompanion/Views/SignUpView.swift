//
//  SignUpView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 17/09/2021.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: ProfileView()) {
                    Text("Sign Up")
                }
                TabItem()
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
