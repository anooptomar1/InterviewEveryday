//
//  QuestionView.swift
//  InterviewEveryday
//
//  Created by Productivity on 10/1/20.
//

import SwiftUI

struct QuestionView: View {
    
    @State var question : Question
    
    var body: some View {
        VStack {
            
            HStack {
                
                VStack {
                    HStack {
                        Text("Question:")
                    .font(Font.custom("Lato-Regular", size: 14))
                    
                        Spacer()
                
                    }.padding(.vertical,2)
            
                    HStack {
                        Text(question.questiontext)
                            .font(Font.custom("Lato-Regular", size: 20))
                            .lineLimit(nil)
                    
                        Spacer()
                    }
                    
                    Spacer()
                }.padding(.vertical,6)
                
                VStack {
                    VStack {
                        Text("Level: ")
                            .font(Font.custom("Lato-Regular", size: 12))
                        
                            Image("sunflower")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18,height:18)
                        
                    }
                    Spacer()
                    VStack {
                        Text("Proficiency: ")
                            .font(Font.custom("Lato-Regular", size: 12))
                        if (question.prof == 1) {
                            Image("orangespa")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18,height:18)
                        }
                    }
                }.padding(.vertical,6)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: screen.height / 12)
        .padding()
        .background(Color.honeydew)
        .cornerRadius(21)
        .padding(.horizontal)
        .shadow(radius: 2)
    }
}
//
//struct QuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        //QuestionView(question: <#Binding<Question>#>)
//    }
//}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
