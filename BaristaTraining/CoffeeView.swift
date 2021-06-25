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
                self.changeIngredients(ingredients: &ingredients)
            }, label: {
                Text(name)
            })
        .buttonStyle(IngredientsButtonStyle(tapped: self.tapped, myColor: self.myColor))
        
    } // end of body
    
    func changeIngredients(ingredients: inout [String]) {
        
        if self.tapped {
            ingredients.append(self.name)
            print("TAPPED:", ingredients)
        } else {
            let index = ingredients.firstIndex(of: self.name)
            ingredients.remove(at: index!)
            print("UNTAPPED:", ingredients)
        }
        
    } //end of changeIngredients

}

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
    @State var index : Int = 0
    @State var showAlert = false
    @State var isCorrect = false
    @State var score = 0
    @State var view = IngredientsView()
    
    var body : some View {
        VStack(alignment: .center, spacing: 20) {
            if (self.index < coffees.count) {
                // render directions for the current coffee
                Text("\(self.index+1). Please make a " + coffees[self.index].label.uppercased())
                
                // render mug image or coffees[self.index].img
                Image("mug")
                
                // render submit button
                Button(action:{
                    self.onSubmit()
                },label: {
                    Text("SUBMIT")
                })
                .alert(isPresented: $showAlert, content: isCorrect ? {
                    Alert(title: Text("Correct"), message: Text("You made the coffee correctly!"), dismissButton: Alert.Button.default(Text("NEXT"), action: { self.index += 1 }))
                } : { Alert(title: Text("Incorrect"), message: Text(coffees[self.index].message), dismissButton: Alert.Button.default(Text("NEXT"), action: { self.index += 1 }) ) }
                )
                
            } // end of if
            else {
                FinalView(score : self.score)
            }
        } // end of VStack
    } // end of body
    
    func onSubmit() {
        
        // check if ingredients match the answer
        isCorrect = self.checkIngredients(ingredients: ingredients)
        if isCorrect {
            self.score += 1
            print("SCORE:", self.score)
        }
        
        // show alert
        showAlert.toggle()
        
    }
    
    func checkIngredients(ingredients: [String]) -> Bool {
        return coffees[self.index].answer == ingredients
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
