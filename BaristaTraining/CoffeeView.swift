//
//  ContentView.swift
//  BaristaTraining
//
//  Created by Asl on 6/23/21.
//

import SwiftUI

// set for storing selected ingredients
private var ingredients = Set<String>()

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

struct IngredientsView: View {
    let brown = Color(red: 0.78, green: 0.56, blue: 0.44)

    var body: some View {
        VStack {
            HStack{
                IngredientBtn(name: "espresso", myColor: brown)
                IngredientBtn(name: "hot water", myColor: brown)
            }
            HStack{
                IngredientBtn(name: "brewed coffee", myColor: brown)
                IngredientBtn(name: "steamed milk", myColor: brown)
            }
            HStack{
                IngredientBtn(name: "half & half", myColor: brown)
                IngredientBtn(name: "whipped cream", myColor: brown)
            }
            HStack{
                IngredientBtn(name: "milk foam", myColor: brown)
                IngredientBtn(name: "lots of milk foam", myColor: brown)
            }
            HStack{
                IngredientBtn(name: "irish whiskey", myColor: brown)
                IngredientBtn(name: "chocolate syrup", myColor: brown)
            }
        }
    }
} // end of IngredientsView

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
        
struct CoffeePage : View {
    // var for number of coffee
    @State var index : Int = 0
    // var for correct answers
    @State var score = 0
    @State var showAlert = false
    @State var isCorrect = false
    
    var body : some View {
        VStack(alignment: .center, spacing: 20) {
            
            // continue game if there are still coffees
            if (self.index < coffees.count) {
                
                // render directions for the current coffee
                Text("\(self.index+1). Please make a " + coffees[self.index].label.uppercased())
                
                // render mug image or coffees[self.index].img
                Image("mug")
                
                IngredientsView()
                
                // render submit button, which when clicked
                // will trigger an alert that will increment
                // the index to go to the next coffee
                Button(action:{
                    self.onSubmit()
                },label: {
                    Text("SUBMIT")
                })
                .alert(isPresented: $showAlert, content: isCorrect ? {
                    Alert(title: Text("Correct"), message: Text("You made the coffee correctly!"), dismissButton: Alert.Button.default(Text("NEXT"), action: { self.index += 1 }))
                } : { Alert(title: Text("Incorrect"), message: Text(coffees[self.index].message), dismissButton: Alert.Button.default(Text("NEXT"), action: { self.index += 1 }) ) }
                )
                
            }
            
            // after last coffee render final view with score
            else {
                FinalView(score : self.score)
            }
        }
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




//Button(action: {
//    isCorrect = checkIngredients(ingredients: ingredients, coffee: randCoffee)
//    showAlert.toggle()
//    if isCorrect {
//        randCoffee = getRandomCoffee()
//    }
//}, label: {
//    Text("SUBMIT")
//})
//.alert(isPresented: $showAlert, content: isCorrect ? {
//       Alert(title: Text("Success"), message: Text("You made the coffee correctly :)"), dismissButton: .default(Text("OK")))
//       } : { Alert(title: Text("Failure"), message: Text("You made the coffee incorrectly :("), dismissButton: .default(Text("Try Again"))) }
//)
