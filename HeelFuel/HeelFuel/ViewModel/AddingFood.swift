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

class AddFoodViewModel: ObservableObject {
//    private let service = foodRequestService()

    var foodList: [[Food]] = [[]]
    var test: [Food] = []
    var state: LoadingState = .idle
    var totalCalories: Int = 0
    var carbs: Int = 0
    var fat: Int = 0
    var protein: Int = 0
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

    public func addFoodValues(food: Food) {
        totalCalories += Int(food.calories.digits)!
        fat += Int(food.totalFat.digits)!
        carbs += Int(food.totalCarbohydrate.digits)!
        protein += Int(food.protein.digits)!
    }
}
