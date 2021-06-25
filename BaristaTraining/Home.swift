//
//  Home.swift
//  BaristaTraining
//
//  Created by Asl on 6/24/21.
//

import SwiftUI

let darkBrown = Color(red: 0.28, green: 0.17, blue: 0.11)
let beige = Color(red: 0.98, green: 0.96, blue: 0.93)

//first view of the app
struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            NavigationView{
                VStack(spacing: 20){

                    Text("Barista Master")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(darkBrown)

                    //button to start the quiz
                    NavigationLink(destination: CoffeePage()) {
                        Text("START TRAINING")
                            .foregroundColor(darkBrown)
                    }
                }
                // Custom nav bar back button
                .navigationBarTitle("Restart",displayMode: .inline)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }.background(beige.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
        }
        
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
