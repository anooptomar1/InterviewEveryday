//
//  LaunchScreen.swift
//  InterviewEveryday
//
//  Created by Productivity on 10/1/20.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
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
                
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
