//
//  CoffeeModel.swift
//  BaristaTraining
//
//  Created by Asl on 6/24/21.
//

import Foundation

// structure of information for a single coffee
struct CoffeeModel {
    var label: String
    var answer: Set<String>
    var message: String
}

var coffees : [CoffeeModel] = [

    CoffeeModel(
            label: "mocha",
            answer: ["espresso", "chocolate syrup", "steamed milk", "whipped cream"],
            message: "mocha = espresso + chocolate syrup + steamed milk + whipped cream"
    ),

    CoffeeModel(
            label: "cappuccino",
            answer: ["espresso", "steamed milk", "lots of milk foam"],
            message: "cappuccino = espresso + steamed milk + lots of milk foam"
    ),

    CoffeeModel(
            label: "macchiato",
            answer: ["espresso", "milk foam"],
            message: "macchiato = espresso + milk foam"
    ),

    CoffeeModel(
            label: "irish coffee",
            answer: ["brewed coffee", "whipped cream", "irish whiskey"],
            message: "irish coffee = brewed coffee + whipped cream + irish whiskey"
    ),

    CoffeeModel(
            label: "caffe au lait",
            answer: ["brewed coffee", "steamed milk"],
            message: "caffe au lait = brewed coffee + steamed milk"
    ),

    CoffeeModel(
            label: "flat white",
            answer: ["espresso", "steamed milk"],
            message: "flat white = espresso + steamed milk"
    ),

    CoffeeModel(
            label: "breve",
            answer: ["espresso", "half & half", "milk foam"],
            message: "breve = espresso + half & half + milk foam"
    ),

    CoffeeModel(
            label: "espresso con panna",
            answer: ["whipped cream", "espresso"],
            message: "espresso con panna = whipped cream + espresso"
    ),

    CoffeeModel(
            label: "mocha breve",
            answer: ["chocolate syrup", "whipped cream", "espresso", "half & half"],
            message: "mocha breve = chocolate syrup + whipped cream + espresso + half & half"
    ),

    CoffeeModel(
            label: "americano",
            answer: ["espresso", "hot water"],
            message: "americano = espresso + hot water"
    ),

    CoffeeModel(
            label: "latte",
            answer: ["espresso", "steamed milk", "milk foam"],
            message: "latte = espresso + steamed milk + milk foam"
    ),
    
]

