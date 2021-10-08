//
//  Auth.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 08/10/2021.
//

import Foundation
import Firebase

extension Auth {
    func authenticate(email: String, password: String) -> Bool{
        var success = false
        self.signIn(withEmail: email, password: password){ (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
                success = true
            }
        }
        return success
    }
}
