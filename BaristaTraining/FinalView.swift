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
        VStack(alignment: .center) {
            if score == 11 {
                Text("Congratulations! You have successfully completed the barista training exam. Now go have some coffee to celebrate!")
            } else {
                Text("You have failed the barista training exam. Nice try!")
                Text("Your final score is: \(score)")
            }
            
        }
    }
}
