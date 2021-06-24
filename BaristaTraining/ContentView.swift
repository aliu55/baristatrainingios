//
//  ContentView.swift
//  BaristaTraining
//
//  Created by Asl on 6/23/21.
//

import SwiftUI

let coffees = ["latte", "cappuccino", "americano", "macchiato", "mocha", "flat white"]
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

    var body: some View {
        VStack {
            Spacer()
            Text("Please make a " + coffees[0].uppercased())
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
                let coffee = coffees[0]
                print(checkIngredients(ingredients: ingredients, coffee: coffee))
            }, label: {
                Text("SUBMIT")
            })
            
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
//    americano - water, espresso
//    latte - espresso, steamed milk, milk foam
    if coffee == "latte" {
        if ingredients.count == 3 && ingredients.contains("espresso") && ingredients.contains("steamed milk") && ingredients.contains("milk foam") {
            return true
        }
    }
    if coffee == "cappuccino" {
        if coffee.count == 2 && coffee.contains("hot water") && coffee.contains("steamed milk") {
            return true
        }
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
//                .foregroundColor(.white)
//                .padding(15)
//                .background(RoundedRectangle(cornerRadius: 5).fill(Color(red: 0.78, green: 0.56, blue: 0.44)))
//                .compositingGroup()
//                .shadow(color: .black, radius: 3)
//                .opacity(self.pressed ? 0.5 : 1.0)
//                .scaleEffect(self.pressed ? 0.8 : 1.0)
//                .onLongPressGesture(minimumDuration: 2.5, maximumDistance: .infinity, pressing: { pressing in withAnimation(.easeInOut(duration: 1.0)) {
//                    self.pressed = pressing
//                    }
//                }, perform: { })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


        //                HStack(spacing: 20){
        //                    Button(action: {
        //                                    print("MyNewPrimitiveButton triggered. Is it printed ?")
        //                                }){ Text("My NEW primitive Button").padding() }
        //
        //                    Button("Milk") {
        //                        print("Milk")
        //                    }
        //                        .foregroundColor(.white)
        //                        .padding()
        //                        .background(Color.accentColor)
        //                        .cornerRadius(8)
        //                    Button("Espresso") {
        //                        print("Espresso")
        //                    }
        //                    .foregroundColor(.white)
        //                    .padding()
        //                    .background(Color(red: 0.78, green: 0.56, blue: 0.44))
        //                    .cornerRadius(10)
        //                }
                        

