//
//  TimerView.swift
//  InterviewEveryday
//
//  Created by Productivity on 10/2/20.
//

import SwiftUI

struct TimerView: View {
    
    @State var start = false
    @State var moveOn = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeAlloc : Int
    @Binding var toggleAnswerView : Bool
    
    var body: some View {
        ZStack{
              VStack{
                  
                  ZStack{
                      
                      Circle()
                      .trim(from: 0, to: 1)
                          .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                      .frame(width: 140, height: 140)
                      
                      Circle()
                          .trim(from: 0, to: self.to)
                          .stroke(Color.mossGreen, style: StrokeStyle(lineWidth: 35, lineCap: .round))
                      .frame(width: 140, height: 140)
                      .rotationEffect(.init(degrees: -90))
                      
                      
                      VStack{
                          
                          Text(String(self.count))
                              .font(.system(size: 30))
                              .fontWeight(.bold)

                      }
                  }
                  
                if (!self.moveOn) {
                  HStack(spacing: 20){
                      
                      Button(action: {
                          
                          if self.count == timeAlloc {
                              
                              self.count = 0
                              withAnimation(.default){
                                  
                                  self.to = 0
                              }
                          }
                          self.start.toggle()
                          
                      }) {
                          
                          HStack(spacing: 15){
                              
                              Image(systemName: self.start ? "pause.fill" : "play.fill")
                                  .foregroundColor(.white)
                              
                              Text(self.start ? "Pause" : "Begin")
                                  .foregroundColor(.white)
                          }
                          .padding(.vertical)
                          .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                          .background(Color.forestgreen)
                          .clipShape(Capsule())
                          .shadow(radius: 6)
                      }
                      
                      Button(action: {
                          
                          self.count = 0
                          
                          withAnimation(.default){
                              
                              self.to = 0
                          }
                          
                      }) {
                          
                          HStack(spacing: 15){
                              
                              Image(systemName: "arrow.clockwise")
                                  .foregroundColor(.forestgreen)
                              
                              Text("Restart")
                                  .foregroundColor(.forestgreen)
                              
                          }
                          .padding(.vertical)
                          .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                          .background(
                          
                              Capsule()
                                  .stroke(Color.forestgreen, lineWidth: 2)
                          )
                          .shadow(radius: 6)
                      }
                  }
                  .padding(.top, 55)
                } else {
                    HStack {
                        
                        Button(action: {
                            
                            
                            self.toggleAnswerView.toggle()
                            
                        }) {
                            
                            HStack(spacing: 15){
                                
                                Image(systemName: "play.fill")
                                    .foregroundColor(.white)
                                
                                Text("Check Yourself")
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 25)
                            .background(Color.forestgreen)
                            .clipShape(Capsule())
                            .shadow(radius: 6)
                        }
                        
                        
                    }.padding(.top, 55)
                }
              }
                      
        }
        .frame(height: screen.height / 3)
        .onReceive(self.time) { (_) in
            
            if self.start{
                
                if self.count != timeAlloc {
                    
                    self.count += 1
                    print("hello")
                    
                    withAnimation(.default){
                        
                        self.to = CGFloat(self.count) / CGFloat((timeAlloc * 60))
                    }
                }
                else{
                
                    self.start.toggle()
                    self.moveOn.toggle()
                    
                }

            }
            
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timeAlloc: 3, toggleAnswerView: .constant(false))
    }
}
