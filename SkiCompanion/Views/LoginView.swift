//
//  LoginView.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 01/10/2021.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var state: StateController
    var body: some View {
        NavigationLink(destination: RootTabView()) {
            Text("Login")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
