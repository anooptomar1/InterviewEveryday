//
//  ExpandedQuestionView.swift
//  InterviewEveryday
//
//  Created by Productivity on 10/2/20.
//

import SwiftUI

struct ExpandedQuestionView: View {
    
    @State var question : Question
    @Binding var toggleQuestionView : Bool
    @Binding var toggleAnswerView : Bool
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "arrow.left")
                    .font(.system(size: 24))
                    .foregroundColor(.forestgreen)
                    .padding()
                    .onTapGesture {
                        self.toggleQuestionView.toggle()
                    }
                
                Spacer()
            }.padding(.top,16)
            .padding(.bottom,8)
            
            Text(question.questiontext)
                .font(Font.custom("Lato-Bold", size: 54))
                .multilineTextAlignment(.center)
            
            // Timer
            TimerView(timeAlloc: question.timeAlloc, toggleAnswerView: self.$toggleAnswerView)
            
            Text("You have " + String(question.timeAlloc) + " minutes to answer!")
                .font(Font.custom("Lato-Regular", size: 18))
            Spacer()
            
            
        }
        .padding()
        .navigationBarHidden(true)
        //.frame(width: screen.width, height: screen.height)
        .background(Color.lightGreen)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ExpandedQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedQuestionView(question: Question(questionid: "", questiontext: "Tell me about a time you earned the trust of a group.", timeAlloc: 3, buzzwords: [], answer: "Bruh", level: 1, prof: 1), toggleQuestionView: .constant(true), toggleAnswerView: .constant(false))
    }
}
