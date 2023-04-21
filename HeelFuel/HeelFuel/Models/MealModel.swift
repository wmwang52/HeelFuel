//
//  MealModel.swift
//  HeelFuel
//
//  Created by Milan Dutta on 4/14/23.
//

//MARK: Creates the model for the meals

import Foundation
import SwiftUI

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
