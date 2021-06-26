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
        ZStack {
            NavigationView{
                splashImageBackground
                    .overlay(
                VStack(spacing: 20){

                    Text("Barista Master")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(darkBrown)

                    //button to start the quiz
                    NavigationLink(destination: CoffeePage()) {
                        VStack(spacing: 20){
                            Image("play")
                            Text("START TRAINING")
                            .foregroundColor(darkBrown)
                        }
                    }
                }
                // Custom nav bar back button
                .navigationBarTitle("Restart",displayMode: .inline)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                )
            }
            .accentColor(TEXT_COLOR)
            .background(beige.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
        }
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
