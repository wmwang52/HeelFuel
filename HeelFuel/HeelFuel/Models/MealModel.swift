//
//  MealModel.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

import Foundation

struct MealViewModel {
    var mealTimeName: String
    var mealEmoji: String
    var mealImageName: String?
    var mealIndex: Int?
    var totalCaloriesConsumed: Int
    var totalCarbsConsumed: Int
    var totalFatConsumed: Int
    var totalProteinConsumed: Int
    var consumedFoodItems: [FoodModel]
}
