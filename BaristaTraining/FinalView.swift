//
//  FinalView.swift
//  BaristaTraining
//
//  Created by Asl on 6/25/21.
//

import SwiftUI

struct FinalView : View {
    var score: Int
    var body: some View {
        VStack() {
            if score > 2  {
                Text("Congrats! You are now a barista master. \n\nNow go have some coffee to celebrate!")
                    .foregroundColor(darkBrown)
                    .fontWeight(.heavy)
                    .font(.system(size: 25))
                    .padding(EdgeInsets(top: 120, leading: 20, bottom: 0, trailing: 80))
                
            } else {
                Text("You have failed the barista training exam. Nice try! \n\nNumber of correct answers: \(score)")
                    .foregroundColor(darkBrown)
                    .fontWeight(.heavy)
                    .font(.system(size: 25))
                    .padding(EdgeInsets(top: 120, leading: 20, bottom: 0, trailing: 80))
            }
            
        }.background(beige.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
}
