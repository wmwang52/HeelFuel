//
//  MealModel.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

import Foundation

struct MealModel {
    var mealTime: String
    var emoji: String
    var image: String?
    var index: Int?
    var caloriesEaten: Int
    var carbsEaten: Int
    var fatEaten: Int
    var proteinEaten: Int
    var mealList: [Food]
}
