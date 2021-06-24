//
//  ContentView.swift
//  BaristaTraining
//
//  Created by Asl on 6/23/21.
//

import SwiftUI

private var ingredients = [String]()

struct IngredientBtn: View {
    var name: String
    var myColor: Color
    
    @State var tapped = false
    
    var body: some View {
        Button(action: {
                tapped.toggle()
                changeIngredients(
                    tapped: tapped,
                    ingredients: &ingredients,
                    name: name
                )
            }, label: {
                Text(name)
            })
        .buttonStyle(MyButtonStyle(tapped: tapped, myColor: myColor))
    }
}

struct IngredientsView: View {
    let brown = Color(red: 0.78, green: 0.56, blue: 0.44)
    @State var showAlert = false
    @State var isCorrect = false

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

func changeIngredients(tapped: Bool, ingredients: inout [String], name: String) {
    
    if tapped {
        ingredients.append(name)
        print("TAPPED:", ingredients)
    } else {
        let index = ingredients.firstIndex(of: name)
        ingredients.remove(at: index!)
        print("UNTAPPED:", ingredients)
    }
    
}

func checkIngredients(ingredients: [String], coffee: String) -> Bool {
    return true
}

struct MyButtonStyle: ButtonStyle {
    var tapped: Bool
    var myColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        MyButton(configuration: configuration, myColor: myColor, tapped: tapped)
    }
    
    struct MyButton: View {
        var pressed = false
        
        let configuration: Configuration
        let myColor: Color
        var tapped: Bool
        
        var body: some View {
            return configuration.label
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(tapped ?
                AnyView(RoundedRectangle(cornerRadius: 10)
                .stroke(myColor, lineWidth: 2)
                .background(myColor.cornerRadius(10))) :
                AnyView(RoundedRectangle(cornerRadius: 10)
                 .stroke(myColor, lineWidth: 2))
                )
        }
    }
}


//Game
//    State i: index of coffees array
//    State score: tracks score
//    var body
//        Text
//        Buttons
//        Submit
//    func buttonAction
        
struct CoffeePage : View {
    //index of Coffees array
    @State var index : Int = 0
    
    //keep track of successful coffees
    @State var score = 0
    
    var body : some View {
        VStack(alignment: .center, spacing: 20) {
            if (self.index < coffees.count) {
                
                // render coffee label
                Text("Please make a " + coffees[self.index].label)
                
                // render mug image or coffees[self.index].img
                Image("mug")
                
                // render IngredientsView
                IngredientsView()
                
                // render submit button
                Button(action:{
                    self.onSubmit()
                },label: {
                    Text("SUBMIT")
                })
                
            } // end of if
        } // end of VStack
    } // end of body
    
    func onSubmit() {
        // check if ingredients match the answer
        if (coffees[self.index].answer == ingredients) {
            self.score += 1
        }
        
        // incremet index to go to next CoffeeModel
        self.index = self.index + 1
    }
}


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
