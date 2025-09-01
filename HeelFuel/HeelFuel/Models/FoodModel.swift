//
//  FoodModel.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

import Foundation

struct FoodModel: Codable, Hashable, Identifiable {
    var id = UUID()
    var allergenInformation, calorieCount, caloriesFromFatContent, cholesterolContent: String
    var dietaryFiberContent, ingredientList, foodName, proteinContent: String
    var saturatedFatContent, servingSizeDescription, sodiumContent, sugarContent: String
    var totalCarbohydrateContent, totalFatContent: String
    var transFatContent: String
}
