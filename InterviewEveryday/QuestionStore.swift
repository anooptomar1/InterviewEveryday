//
//  QuestionStore.swift
//  InterviewEveryday
//
//  Created by Productivity on 10/1/20.
//

import Foundation
import Firebase

class QuestionStore : ObservableObject {
    
    var db = Firestore.firestore()
    @Published var qotD : Question = Question(questionid: "", questiontext: "", timeAlloc: 0, buzzwords: [], answer: "", level: 1, prof: 1)
    @Published var level1Questions : [Question] = []
    
    func fetchQotD(completion: @escaping (Question) -> Void) {
        db.collection("level1").document("questionoftheday").addSnapshotListener ({(snapshot, error) in
                if let err = error {
                    print("Error fetching: \(err)")
                    completion(self.qotD)
                } else {
                    let data = snapshot!.data()
                    print("success")
                    let qid = snapshot!.documentID
                    let questiontext = data?["questiontext"] as? String ?? "Question content"
                    let timeAlloc = data?["timeAlloc"] as? Int ?? 3
                    let buzzwords = data?["buzzwords"] as? [String] ?? []
                    let answer = data?["answer"] as? String ?? "Answer content"
                    let level = data?["level"] as? Int ?? 1
                    
                    self.qotD = Question(questionid: qid, questiontext: questiontext, timeAlloc: timeAlloc, buzzwords: buzzwords, answer: answer, level: level, prof: 1)
                    completion(self.qotD)
                }
            
        })
        
    }
    
    func fetchLevel1Questions(completion: @escaping (Bool) -> Void) {
        
        db.collection("level1").getDocuments(completion: {(querySnapshot, error) in
            
            if let err = error {
                print("Error in fetching docs: \(err)")
                completion(false)
            } else {
                for document in querySnapshot!.documents {
                    
                    print("success")
                    let data = document.data()
                    let qid = document.documentID
                    let questiontext = data["questiontext"] as? String ?? "Question content"
                    let timeAlloc = data["timeAlloc"] as? Int ?? 3
                    let buzzwords = data["buzzwords"] as? [String] ?? []
                    let answer = data["answer"] as? String ?? "Answer content"
                    let level = data["level"] as? Int ?? 1
                    
                    let newQuestion = Question(questionid: qid, questiontext: questiontext, timeAlloc: timeAlloc, buzzwords: buzzwords, answer: answer, level: level, prof: 1)
                    
                    self.level1Questions.append(newQuestion)
                    
                    
                }
                completion(true)
            }
        })
            
    }
    
    func fetchLevel2Questions(completion: @escaping (Bool) -> Void) {
        
        db.collection("level2").getDocuments(completion: {(querySnapshot, error) in
            
            if let err = error {
                print("Error in fetching docs: \(err)")
                completion(false)
            } else {
                for document in querySnapshot!.documents {
                    
                    print("success")
                    let data = document.data()
                    let qid = document.documentID
                    let questiontext = data["questiontext"] as? String ?? "Question content"
                    let timeAlloc = data["timeAlloc"] as? Int ?? 3
                    let buzzwords = data["buzzwords"] as? [String] ?? []
                    let answer = data["answer"] as? String ?? "Answer content"
                    let level = data["level"] as? Int ?? 1
                    
                    let newQuestion = Question(questionid: qid, questiontext: questiontext, timeAlloc: timeAlloc, buzzwords: buzzwords, answer: answer, level: level, prof: 1)
                    
                    self.level1Questions.append(newQuestion)
                    
                    
                }
                completion(true)
            }
        })
            
    }
    
    func fetchLevel3Questions(completion: @escaping (Bool) -> Void) {
        
        db.collection("level3").getDocuments(completion: {(querySnapshot, error) in
            
            if let err = error {
                print("Error in fetching docs: \(err)")
                completion(false)
            } else {
                for document in querySnapshot!.documents {
                    
                    print("success")
                    let data = document.data()
                    let qid = document.documentID
                    let questiontext = data["questiontext"] as? String ?? "Question content"
                    let timeAlloc = data["timeAlloc"] as? Int ?? 3
                    let buzzwords = data["buzzwords"] as? [String] ?? []
                    let answer = data["answer"] as? String ?? "Answer content"
                    let level = data["level"] as? Int ?? 1
                    
                    let newQuestion = Question(questionid: qid, questiontext: questiontext, timeAlloc: timeAlloc, buzzwords: buzzwords, answer: answer, level: level, prof: 1)
                    
                    self.level1Questions.append(newQuestion)
                    
                    
                }
                completion(true)
            }
        })
            
    }
        
}
    

