//
//  ContentView.swift
//  BaristaTraining
//
//  Created by Asl on 6/23/21.
//

import SwiftUI

let coffees = ["mocha", "cappuccino", "macchiato", "irish coffee", "caffe au lait", "flat white", "breve", "espresso con panna", "mocha breve", "americano", "latte"]
var ingredients = [String]()

struct NewButton: View {
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

struct ContentView: View {
    let brown = Color(red: 0.78, green: 0.56, blue: 0.44)
    let randomInt = Int.random(in: 0..<coffees.count)
    @State var showAlert = false
    @State var isCorrect = false

    var body: some View {
        VStack {
            Spacer()
            Text("Please make a " + coffees[randomInt].uppercased())
            Spacer()
            Image("mug")
            Spacer()
            
            //test button
            Button("Test"){
                print("Test")
                print(ingredients)
            }
            Group {
                HStack{
                    NewButton(name: "espresso", myColor: brown)
                    NewButton(name: "hot water", myColor: brown)
                }
                HStack{
                    NewButton(name: "brewed coffee", myColor: brown)
                    NewButton(name: "steamed milk", myColor: brown)
                }
                HStack{
                    NewButton(name: "half & half", myColor: brown)
                    NewButton(name: "whipped cream", myColor: brown)
                }
                HStack{
                    NewButton(name: "milk foam", myColor: brown)
                    NewButton(name: "lots of milk foam", myColor: brown)
                }
                HStack{
                    NewButton(name: "irish whiskey", myColor: brown)
                    NewButton(name: "chocolate syrup", myColor: brown)
                }
            }
            // submit
            Button(action: {
                let coffee = coffees[randomInt]
                isCorrect = checkIngredients(ingredients: ingredients, coffee: coffee)
                print("isCorrect:", isCorrect)
                showAlert.toggle()
            }, label: {
                Text("SUBMIT")
            })
            .alert(isPresented: $showAlert, content: isCorrect ? {
                   Alert(title: Text("Success"), message: Text("You made the coffee correctly :)"), dismissButton: .default(Text("OK")))
                   } : { Alert(title: Text("Failure"), message: Text("You made the coffee incorrectly :("), dismissButton: .default(Text("Try Again"))) }
            )
            
            Spacer()
        }
    }
}

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
    if coffee == "mocha" {
        return ingredients.count == 4 && ingredients.contains("espresso") && ingredients.contains("chocolate syrup") && ingredients.contains("steamed milk") && ingredients.contains("whipped cream")
    }

    if coffee == "cappuccino" {
        return ingredients.count == 3 && ingredients.contains("espresso") && ingredients.contains("steamed milk") && ingredients.contains("lots of milk foam")
    }

    if coffee == "macchiato" {
        return ingredients.count == 2 && ingredients.contains("espresso") && ingredients.contains("milk foam")
    }

    if coffee == "irish coffee" {
        return ingredients.count == 3 && ingredients.contains("coffee") && ingredients.contains("whipped cream") && ingredients.contains("irish whiskey")
    }

    if coffee == "caffe au lait" {
        return ingredients.count == 2 && ingredients.contains("coffee") && ingredients.contains("steamed milk")
    }

    if coffee == "flat white" {
        return ingredients.count == 2 && ingredients.contains("espresso") && ingredients.contains("steamed milk")
    }

    if coffee == "breve" {
        return ingredients.count == 3 && ingredients.contains("espresso") && ingredients.contains("half & half") && ingredients.contains("milk foam")
    }

    if coffee == "espresso con panna" {
        return ingredients.count == 2 && ingredients.contains("whipped cream") && ingredients.contains("espresso")
    }

    if coffee == "mocha breve" {
        return ingredients.count == 4 && ingredients.contains("chocolate syrup") && ingredients.contains("whipped cream") && ingredients.contains("espresso") && ingredients.contains("half & half")
    }

    if coffee == "americano" {
        return ingredients.count == 2 && ingredients.contains("espresso") && ingredients.contains("hot water")
    }

    if coffee == "latte" {
        return ingredients.count == 3 && ingredients.contains("espresso") && ingredients.contains("steamed milk") && ingredients.contains("milk foam")
    }
    return false
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
