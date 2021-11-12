//
//  View.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 23/09/2021.
//

import Foundation
import SwiftUI

extension View {
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true),
                    isActive: binding
                ){
                    EmptyView()
                }
            }
        }
    }
}
