//
//  Home.swift
//  BaristaTraining
//
//  Created by Asl on 6/24/21.
//

import SwiftUI

//first view of the app
struct ContentView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
            // Custom nav bar back button
            .navigationBarTitle("Restart",displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
