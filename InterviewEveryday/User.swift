//
//  User.swift
//  InterviewEveryday
//
//  Created by Productivity on 10/1/20.
//

import Foundation

class UserData: ObservableObject, Identifiable {
    
    @Published var uid: String {
        didSet {
            UserDefaults.standard.set(uid, forKey: "uid")
        }
    }
    
    @Published var firstName : String {
        didSet {
            UserDefaults.standard.set(firstName, forKey: "firstName")
        }
    }
    
    @Published var questionsProf : [String : Int] {
        didSet {
            UserDefaults.standard.set(questionsProf, forKey: "questionsProf")
        }
    }
    
    init() {
        
        self.uid = UserDefaults.standard.object(forKey: "uid") as? String ?? ""
        self.firstName = UserDefaults.standard.object(forKey: "firstName") as? String ?? ""
        self.questionsProf = UserDefaults.standard.object(forKey: "questionsProf") as? [String : Int] ?? [:]
        
    }
    
}
