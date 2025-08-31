//
//  MealModel.swift
//  HeelFuel
//
//  Created by Milan Dutta on 4/14/23.
//

//MARK: Creates the model used for the food

import Foundation

struct Food: Codable, Hashable, Identifiable {
    var id = UUID()
    var allergens, calories, caloriesFromFat, cholestrol: String
    var dietaryFiber, ingredients, name, protein: String
    var saturatedFat, servingSize, sodium, sugars: String
    var totalCarbohydrate, totalFat: String
    var transFat: String
}
