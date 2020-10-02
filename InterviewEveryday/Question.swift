//
//  Question.swift
//  InterviewEveryday
//
//  Created by Productivity on 10/1/20.
//

import Foundation

struct Question : Identifiable {
    var id = UUID()
    var questionid : String
    var questiontext : String
    var timeAlloc : Int
    var buzzwords : [String]
    var answer : String
    var level : Int
    var prof : Int
}
