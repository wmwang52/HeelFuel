//
//  AddingFoodViewModel.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

// MARK: ViewModel used in adding foods using UserDefaults to store the data

import Foundation
import Observation

@MainActor
@Observable

class FoodManagementViewModel: ObservableObject {
//    private let service = foodRequestService()

    var availableFoodCategories: [[FoodModel]] = [[]]
    var testFoodItems: [FoodModel] = []
    var currentLoadingState: LoadingStateModel = .idle
    var totalCaloriesConsumed: Int = 0
    var totalCarbsConsumed: Int = 0
    var totalFatConsumed: Int = 0
    var totalProteinConsumed: Int = 0
//
//    public func findFoods() {
//        Task {
//            do {
//                let temp = try await service.requestFoods()
//                foodList = temp
//                state = .success(foodList)
//            }
//            catch {
//                state = .error(error.localizedDescription)
//                print("\(error)")
//            }
//        }
//    }

    public func addFoodNutritionalValues(foodItem: FoodModel) {
        totalCaloriesConsumed += Int(foodItem.calorieCount.digits)!
        totalFatConsumed += Int(foodItem.totalFatContent.digits)!
        totalCarbsConsumed += Int(foodItem.totalCarbohydrateContent.digits)!
        totalProteinConsumed += Int(foodItem.proteinContent.digits)!
    }
}
