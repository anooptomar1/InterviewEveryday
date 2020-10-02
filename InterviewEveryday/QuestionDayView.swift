//
//  QuestionDayView.swift
//  InterviewEveryday
//
//  Created by Productivity on 10/1/20.
//

import SwiftUI

struct QuestionDayView: View {
    var body: some View {
        VStack {
            
            HStack {
                Text("Question of the Day")
                    .font(Font.custom("Lato-Regular", size: 36))
                    
                
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: screen.height / 8)
        .padding()
        .background(Color.mossGreen)
        .cornerRadius(21)
        .padding(.horizontal)
        .shadow(radius: 2)
    }
}

struct QuestionDayView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDayView()
    }
}

let screen = UIScreen.main.bounds
