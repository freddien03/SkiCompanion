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
    var lastKnownLocation: CLLocation = CLLocation()
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
    
    func getLocation() {
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func userFromData(data: Dictionary<String, Any>) -> User {
        let email: String = data["email"] as! String
        let password: String = data["password"] as! String
        let currentResort: String = data["currentResort"] as! String
        return User(email: email, password: password, currentResort: currentResort, achievements: [])
    }
    
    func achievementFromData(data: Dictionary<String, Any>) -> Achievement {
        let name: String = data["name"] as! String
        let type: String = data["type"] as! String
        let progress: Float = data["progress"] as! Float
        let isComplete: Bool = data["isComplete"] as! Bool
        let goal: Int = data["goal"] as! Int
        let ach = Achievement(name: name, type: type, goal: goal)
        ach.progress = progress
        ach.isComplete = isComplete
        return ach
    }
    
    func getAchievements(ID: String, completion: @escaping (Result<[Achievement], Error>) -> Void){
        var AchList: [Achievement] = []
        let db = Firestore.firestore()
        db.collection("users").document(ID).collection("Achievements").getDocuments() { (querySnapshot, error) in
            if let error = error {
                    print("Error getting documents: \(error)")
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else {
                print(querySnapshot!.documents)
                    for document in querySnapshot!.documents {
                        AchList.append(self.achievementFromData(data: document.data()))
                    }
                DispatchQueue.main.async {
                    completion(.success(AchList))
                }
            }
        }
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
                    self.currentUser = self.userFromData(data: userData)
                    self.getAchievements(ID: ID) { results in
                        switch results {
                            case .failure(let error):
                                print(error.localizedDescription)
                        case .success(let ach):
                            self.currentUser.achievements = ach
                        }
                    }
                    
                }
            }
        }
    }
}
