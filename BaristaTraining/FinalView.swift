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
            if score == NUMBER_OF_QUESTIONS  {
                VStack(alignment: .leading, spacing: 50) {
                    Text("Congrats! You have completed level 1 of the barista training. \n\nNow go have some coffee to celebrate!")
                        .foregroundColor(darkBrown)
                        .fontWeight(.heavy)
                        .font(.system(size: 25))
                    
                    Text("Please leave a review if you'd like to see more levels added :)")
                        .foregroundColor(darkBrown)
                        .font(.system(size: 15))
                }
                .padding(EdgeInsets(top: 120, leading: 20, bottom: 0, trailing: 80))
            } else {
                Text("You have failed the barista training quiz. Nice try! \n\nNumber of correct answers: \(score)")
                    .foregroundColor(darkBrown)
                    .fontWeight(.heavy)
                    .font(.system(size: 25))
                    .padding(EdgeInsets(top: 120, leading: 20, bottom: 0, trailing: 80))
            }
            
        }
    }
}
