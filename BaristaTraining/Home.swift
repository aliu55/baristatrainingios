//
//  Home.swift
//  BaristaTraining
//
//  Created by Asl on 6/24/21.
//

import SwiftUI

//first view of the app
struct ContentView: View {

    //var for the score
    @State var score = 0
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                
                Text("Welcome to the Barista Training")
                
                //button to start the quiz
                NavigationLink(destination: CoffeePage()) {
                    Text("START BARISTA TRAINING")
                }
//                HStack{
//                    //display your score
//                    Text("last score : \(self.score) / \(myQuiz1.count)")
//                        .onAppear(){ //refresh score
//                            self.score = LoadScore(quiz: "myQuiz1")
//                    }
//                }
            }
//            .navigationBarTitle("Quiz example",displayMode: .inline)
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//ContentView
// state var score = 0
//    NavigationView
//      Text: instructions
//      Button: Game()

//Home_Previews
//    ContentView()

//Game
//    State i: index of coffees array
//    State score: tracks score
//    var body
//        Text
//        Buttons
//        Submit
//    func buttonAction
        
