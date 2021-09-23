//
//  SignUpView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 17/09/2021.
//

import SwiftUI

struct SignUpView: View {
    @State private var loggedIn = false
    var body: some View {
        Button("signup", action: { loggedIn.toggle() })
            .navigate(to: RootTabView(), when: $loggedIn)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
