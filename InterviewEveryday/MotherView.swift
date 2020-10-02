//
//  MotherView.swift
//  InterviewEveryday
//
//  Created by Productivity on 10/1/20.
//

import SwiftUI

struct MotherView: View {
    
    @State var isActive = false
    
    var questionStore = QuestionStore()
    var userInfo = UserData()
    
    var body: some View {
        VStack {
            
            if self.isActive {
                ContentView()
            } else {
                LaunchScreen()
                    .onAppear(perform: {
                        
                        questionStore.fetchLevel1Questions { goon in
                            print(goon)
                        }
                        
                        userInfo.firstName = "Bahar"
                    })
            }
            
            
        }
        .environmentObject(userInfo)
        .environmentObject(questionStore)
        .onAppear {
            // 6.
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                // 7.
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}
