//
//  AddFoodViewModel.swift
//  HeelFuel
//
//  Created by Mitchell Anderson on 4/17/23.
//

import Foundation

@MainActor
class AddFoodViewModel: ObservableObject {
    private let service = foodRequestService()
    
    @Published var foodList: [[Food]] = [[]]
    @Published var test: [Food] = []
    @Published var state: LoadingState = .idle
    @Published var totalCalories = UserDefaults.standard.integer(forKey: "calories")
    @Published var carbs: Int = UserDefaults.standard.integer(forKey: "carbs")
    @Published var fat: Int = UserDefaults.standard.integer(forKey: "fat")
    @Published var protein: Int = UserDefaults.standard.integer(forKey: "protein")
    
    public func findFoods() {
        Task {
            do {
                let temp = try await service.requestFoods()
                foodList = temp
                state = .success(foodList)
            }
            catch {
                state = .error(error.localizedDescription)
                print("\(error)")
            }
        }
    }
    
    public func addFoodValues(food: Food) {
        totalCalories += Int(food.calories.digits)!
        UserDefaults.standard.set(totalCalories, forKey: "calories")
        fat += Int(food.totalFat.digits)!
        UserDefaults.standard.set(fat, forKey: "fat")
        carbs += Int(food.totalCarbohydrate.digits)!
        UserDefaults.standard.set(carbs, forKey: "carbs")
        protein += Int(food.protein.digits)!
        UserDefaults.standard.set(protein, forKey: "protein")
        
//        UserDefaults.standard.set(meal, forKey: meal.mealTime)
    }
}
