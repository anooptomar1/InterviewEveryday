//
//  ContentView.swift
//  InterviewEveryday
//
//  Created by Productivity on 10/1/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var questionStore : QuestionStore
    @EnvironmentObject var userInfo : UserData
    
    @State var currentQuestion = Question(questionid: "", questiontext: "", timeAlloc: 0, buzzwords: [], answer: "", level: 1, prof: 1)
    
    @State var toggleQuestionView = false
    @State var toggleAnswerView = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                // navigation links
                NavigationLink(destination: ExpandedQuestionView(question: currentQuestion, toggleQuestionView: self.$toggleQuestionView, toggleAnswerView: self.$toggleAnswerView)
                    .environmentObject(self.userInfo)
                    .environmentObject(self.questionStore)
                        .navigationBarBackButtonHidden(true)
                    , isActive: self.$toggleQuestionView)
                {
                    EmptyView()
                }
                
                NavigationLink(destination: ExpandedAnswerView(question: currentQuestion, toggleAnswerView: self.$toggleAnswerView)
                    .environmentObject(self.userInfo)
                    .environmentObject(self.questionStore)
                        .navigationBarBackButtonHidden(true)
                    , isActive: self.$toggleAnswerView)
                {
                    EmptyView()
                }

                // list of questions
                ScrollView {
                    VStack {
                        
                        VStack {
                            HStack {
                                Text("plan")
                                    .font(Font.custom("Lato-Bold", size: 42))
                                    .foregroundColor(.green)
                                Text("terview")
                                    .padding(.leading,-6)
                                    .font(Font.custom("Lato-Bold", size: 42))
                                
                                Image("planticon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30,height:30)
                                    
                            }.padding(.horizontal)
                            .padding(.top,4)
                            .padding(.bottom,4)
                            
                            Text("planning for your next interview has never been easier")
                                .font(Font.custom("Lato-Regular", size: 14))
                        }.padding(.bottom)
                        
                        QuestionDayView()
                            .padding(.bottom,4)
                        
                        ForEach(0..<self.questionStore.level1Questions.count, id: \.self) {index in
                            QuestionView(toggleQuestionView: self.$toggleQuestionView, question: self.questionStore.level1Questions[index], currentQ: self.$currentQuestion)
                                .padding(.bottom,4)
                                .environmentObject(self.userInfo)
                            
                        }
                    }
                }
                
                
                
            }.navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


