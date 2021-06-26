//
//  ContentView.swift
//  BaristaTraining
//
//  Created by Asl on 6/23/21.
//

import SwiftUI

// set for storing selected ingredients
private var ingredients = Set<String>()

// MARK: Ingredients View
struct IngredientsView: View {
    let allIngredients = ["espresso", "brewed coffee", "hot water", "steamed milk", "milk foam", "lots of milk foam", "half & half", "whipped cream", "irish whiskey", "chocolate syrup"]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20, content: {
                ForEach(0...allIngredients.count - 1, id: \.self) { index in
                    HStack {
                        IngredientBtn(name: allIngredients[index], myColor: LIGHT_BROWN)
                    }
                    .padding(.leading, -10)
                    .padding(.trailing, -10)
                }
            })
            .padding(.leading, 35)
            .padding(.trailing, 35)
        }
        .padding(.bottom, 20)
    }
}

struct IngredientBtn: View {
    
    // var for name of coffee
    var name: String
    // var for styling the color of the buttons
    var myColor: Color
    
    // var for tracking whether button is clicked
    @State var tapped = false
    
    var body: some View {
        
        Button(action: {
                // tap or untap the ingredients button and update ingredients set
                tapped.toggle()
                self.changeIngredients(ingredients: &ingredients)
            
            }, label: {
                Text(name)
                    .foregroundColor(tapped ? .white : darkBrown)
            })
        .buttonStyle(IngredientsButtonStyle(tapped: self.tapped, myColor: self.myColor))
        
    }
    
    func changeIngredients(ingredients: inout Set<String>) {
        // if selected, add ingredient to
        // ingredients set else remove it
        if self.tapped {
            ingredients.insert(self.name)
        } else {
            ingredients.remove(self.name)
        }
        
    }
} // end of IngredientBtn

// MARK: Style
struct IngredientsButtonStyle: ButtonStyle {
    var tapped: Bool
    var myColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration
            .label
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(tapped ?
            AnyView(RoundedRectangle(cornerRadius: 10)
            .stroke(myColor, lineWidth: 2)
            .background(myColor.cornerRadius(10))) :
            AnyView(RoundedRectangle(cornerRadius: 10)
             .stroke(myColor, lineWidth: 2))
            )
    }
} // end of IngredientsButtonStyle

struct SubmitButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration
            .label
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(
                AnyView(RoundedRectangle(cornerRadius: 20)
                .stroke(darkBrown, lineWidth: 2)
                .background(darkBrown.cornerRadius(20)))
            )
    }
    
} // end of SubmitButtonStyle

// MARK: Coffee View
struct CoffeePage : View {
    // var for number of coffee
    @State var index : Int = 0
    // var for correct answers
    @State var score = 0
    @State var showAlert = false
    @State var isCorrect = false
    
    var body : some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    
                    // continue game if there are still coffees
                    if (self.index < coffees.count) {
                        
                        // render directions for the current coffee
                        Text("#\(self.index+1): Please make a " + coffees[self.index].label.uppercased())
                            .foregroundColor(darkBrown)
                            .fontWeight(.heavy)
                            .font(.system(size: 25))
                            .padding(EdgeInsets(top: 40, leading: 20, bottom: 2, trailing: 20))
                            .multilineTextAlignment(.center)
                        
                        Text("Choose the correct ingredients.")
                            .font(.system(size: 15))
                            .foregroundColor(darkBrown)
                        
                        // render mug image or coffees[self.index].img
                        Image("mug")
                            .padding(.bottom, 30)
                            .padding(.top, 30)
                        
                        // render all the ingredients as buttons
                        IngredientsView()
                        
                        // render submit button, which when clicked
                        // will trigger an alert that will increment
                        // the index to go to the next coffee
                        Button(action:{
                            self.onSubmit()
                        },label: {
                            Text("SUBMIT")
                                .foregroundColor(.white)
                        })
                        .buttonStyle(SubmitButtonStyle())
                        .alert(isPresented: $showAlert, content: isCorrect ? {
                            Alert(title: Text("Correct"), message: Text("You made the coffee correctly!"), dismissButton: Alert.Button.default(Text("NEXT"), action: { self.index += 1 }))
                        } : { Alert(title: Text("Incorrect"), message: Text(coffees[self.index].message), dismissButton: Alert.Button.default(Text("NEXT"), action: { self.index += 1 }) ) }
                        )
                        .padding(.top, 10)
                    }
                    
                    // after last coffee render final view with score
                    else {
                        FinalView(score : self.score)
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .background(beige.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
        
    }
    
    func onSubmit() {
        
        // check if ingredients set match the coffee's answer
        isCorrect = self.checkIngredients(ingredients: ingredients)
        
        // increment score if correct
        if isCorrect {
            self.score += 1
        }
        
        // show alert
        showAlert.toggle()
        
    }
    
    func checkIngredients(ingredients: Set<String>) -> Bool {
        return coffees[self.index].answer == ingredients
    }

} // end of CoffeePage
