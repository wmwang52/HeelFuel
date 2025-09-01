//
//  FoodModel.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

import Foundation

struct FoodModel: Codable, Hashable, Identifiable {
    var id = UUID()
    var allergens, calories, caloriesFromFat, cholestrol: String
    var dietaryFiber, ingredients, name, protein: String
    var saturatedFat, servingSize, sodium, sugars: String
    var totalCarbohydrate, totalFat: String
    var transFat: String
}
