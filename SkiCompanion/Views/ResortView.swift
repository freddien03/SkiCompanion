//
//  ResortView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 17/09/2021.
//

import SwiftUI

struct ResortView: View {
    @EnvironmentObject var state: StateController
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button("change resort") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView()
    }
}
