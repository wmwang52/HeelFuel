//
//  AddFoodViewModel.swift
//  HeelFuel
//
//  Created by Mitchell Anderson on 4/17/23.
//

//MARK: ViewModel used in adding foods using UserDefaults to store the data

import Foundation

@MainActor
class AddFoodViewModel: ObservableObject {
    private let service = foodRequestService()
    
    @Published var foodList: [[Food]] = [[]]
    @Published var test: [Food] = []
    @Published var state: LoadingState = .idle
    
    @Published var totalCalories = UserDefaults.standard.integer(forKey: "calories") {
        didSet { UserDefaults.standard.set(totalCalories, forKey: "calories") }
    }
    
    @Published var carbs: Int = UserDefaults.standard.integer(forKey: "carbs") {
        didSet { UserDefaults.standard.set(carbs, forKey: "carbs") }
    }
    
    @Published var fat: Int = UserDefaults.standard.integer(forKey: "fat") {
        didSet { UserDefaults.standard.set(fat, forKey: "fat") }
    }
    
    @Published var protein: Int = UserDefaults.standard.integer(forKey: "protein") {
        didSet { UserDefaults.standard.set(protein, forKey: "protein") }
    }
    
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
        fat += Int(food.totalFat.digits)!
        carbs += Int(food.totalCarbohydrate.digits)!
        protein += Int(food.protein.digits)!
    }
    
    public func resetDefaults() {
        fat = 0
        carbs = 0
        protein = 0
        totalCalories = 0
    }
}
