//
//  ExpandedAnswerView.swift
//  InterviewEveryday
//
//  Created by Productivity on 10/2/20.
//

import SwiftUI

struct ExpandedAnswerView: View {
    
    @State var question : Question
    @Binding var toggleAnswerView : Bool
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "house")
                    .font(.system(size: 24))
                    .foregroundColor(.forestgreen)
                    .padding()
                    .onTapGesture {
                        self.toggleAnswerView.toggle()
                    }
                
                Spacer()
            }.padding(.top,16)
            .padding(.bottom,8)
            
            
            VStack {
                HStack {
                    Text("Main Takeaways (TL;DR):")
                        .font(Font.custom("Lato-Bold", size: 28))
                        .multilineTextAlignment(.center)
                        .padding(.bottom,6)
                    
                    Spacer()
                }
                
                VStack {
                    
                    ForEach (0..<self.question.buzzwords.count, id: \.self) { index in
                        
                        Text("• " + question.buzzwords[index])
                            .font(Font.custom("Lato-Regular", size: 14))
                            .padding(.bottom,8)
                        
                    }
                    
                }
            }.padding(.horizontal)
            .padding(.bottom,8)
            
            HStack {
                
                Text("Your answer should include: ")
                    .font(Font.custom("Lato-Bold", size: 28))
                    .padding(.bottom,6)
                    
                
                Spacer()
                
            }.padding(.leading)
            
            HStack {
                
                Text(question.answer)
                    .lineLimit(nil)
                    .font(Font.custom("Lato-Regular", size: 18))
                
                Spacer()
                
            }.padding(.horizontal)
            
           
            
            Spacer()
            
            
        }
        .padding()
        .navigationBarHidden(true)
        //.frame(width: screen.width, height: screen.height)
        .background(Color.lightGreen)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ExpandedAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedAnswerView(question: Question(questionid: "", questiontext: "Tell me about a time you earned the trust of a group.", timeAlloc: 3, buzzwords: [], answer: "Bruh", level: 1, prof: 1), toggleAnswerView: .constant(false))
    }
}
