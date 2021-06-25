//
//  Home.swift
//  BaristaTraining
//
//  Created by Asl on 6/24/21.
//

import SwiftUI

//first view of the app
struct HomeView: View {
    init() {
        UINavigationBar.changeAppearance(clear: true)
    }
    
    var body: some View {
        NavigationView{
            splashImageBackground
                .overlay(
                    VStack(spacing: 20){
                        
                        Text("Welcome to the Barista Training")
                        
                        //button to start the quiz
                        NavigationLink(destination: CoffeePage()) {
                            Text("START BARISTA TRAINING")
                        }
                    }
                    // Custom nav bar back button
                    .navigationBarTitle("Restart",displayMode: .inline)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                )
        }.accentColor(TEXT_COLOR)
    }
    
    private var splashImageBackground: some View {
        GeometryReader { geometry in
            Image("coffeeBeanPattern")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(width: geometry.size.width)
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
