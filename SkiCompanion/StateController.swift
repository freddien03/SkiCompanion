//
//  StateController.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 30/09/2021.
//

import Foundation
import CoreLocation
import Firebase

class StateController: ObservableObject {
    let locationHandler: LocationHandler = LocationHandler()
    var lastKnownLocation: String = ""
    var currentResort: String
    var currentUser: User
    var UserID: String = "" {
        didSet {
            print(UserID)
            fetchUser(ID: UserID)
        }
    }
    
    init(currentResort: String, currentUser: User) {
        self.currentResort = currentResort
        self.currentUser = currentUser
    }
    
    func userFromData(data: Dictionary<String, Any>) -> User {
        let email: String = data["email"] as! String
        let password: String = data["password"] as! String
        let currentResort: String = data["currentResort"] as! String
        return User(email: email, password: password, currentResort: currentResort, achievements: [])
    }
    
    func fetchUser(ID: String) {
        var userData : [String:Any] = [:]
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(ID)
        
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    userData = data
                    print(userData)
                }
            }
        }
        
        db.collection("users").document(ID).collection("Achievements").getDocuments() { (querySnapshot, error) in
            if let error = error {
                    print("Error getting documents: \(error)")
            } else {
                    for document in querySnapshot!.documents {
                            print("\(document.documentID): \(document.data())")
                    }
            }
        }
        
//        self.currentUser = User(email: "email@email.com", password: "password", currentResort: "verbier", achievements: [])
        self.currentUser = userFromData(data: userData)
    }
    
}
