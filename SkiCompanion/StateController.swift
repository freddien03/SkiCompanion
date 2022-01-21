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
    @Published var latestForecast: WeatherInfo? = nil
    let locationHandler: LocationHandler = LocationHandler()
    let weatherAPI: WeatherAPI = WeatherAPI()
    var lastKnownLocation: CLLocation = CLLocation()
    var currentResort: String {
        didSet{
            getWeather()
        }
    }
    @Published var currentUser: User
    var UserID: String = "" {
        didSet {
            fetchUser(ID: UserID)
        }
    }
    
    init(currentResort: String, currentUser: User) {
        self.currentResort = currentResort
        self.currentUser = currentUser
        getWeather()
    }
    
    // retieve weather stats and put in latestForecast
    func getWeather()  {
        weatherAPI.getWeather(currentResort, completion: { weather in
            if let weather = weather{
                DispatchQueue.main.async {
                    self.latestForecast = weather
                }
            }
        })

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
        let progress: Double = data["progress"] as! Double
        let isComplete: Bool = data["isComplete"] as! Bool
        let goal: Int = data["goal"] as! Int
        let ach = Achievement(name: name, type: type, goal: goal)
        ach.progress = progress
        ach.isComplete = isComplete
        return ach
    }
    
    func getStarterAchievements(completion: @escaping (Result<[Achievement], Error>) -> Void){
        var AchList: [Achievement] = []
        let db = Firestore.firestore()
        db.collection("AchievementsTemplate").getDocuments() { (querySnapshot, error) in
            if let error = error {
                    print("Error getting documents: \(error)")
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else {
                    for document in querySnapshot!.documents {
                        AchList.append(self.achievementFromData(data: document.data()))
                    }
                DispatchQueue.main.async {
                    completion(.success(AchList))
                }
            }
        }
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
        if ID == "" { return }
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
