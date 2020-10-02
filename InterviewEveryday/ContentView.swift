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
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                // navigation links

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
                            QuestionView(question: self.questionStore.level1Questions[index])
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


