//
//  HeelFuelTests.swift
//  HeelFuel
//
//  Created by Milan Dutta on 4/17/23.
//

//MARK: Tests the the functionality of the Models

import XCTest

class MealModelTests: XCTestCase {
    func testMealModelInitialization() throws {
        let mealModel = MealModel(mealTime: "Breakfast", emoji: "🥞", mealCalories: "300", image: nil, index: 0)
        XCTAssertEqual(mealModel.mealTime, "Breakfast")
        XCTAssertEqual(mealModel.emoji, "🥞")
        XCTAssertEqual(mealModel.mealCalories, "300")
        XCTAssertNil(mealModel.image)
        XCTAssertEqual(mealModel.index, 0)
    }
}

class FoodModelTests: XCTestCase {

    func testFoodCodable() throws {
        let food = Food(allergens: "Eggs", calories: "280", caloriesFromFat: "100", cholestrol: "50", dietaryFiber: "5", ingredients: "Flour, sugar, eggs", name: "Blueberry Muffin", protein: "7", saturatedFat: "2", servingSize: "1 muffin (113g)", sodium: "350", sugars: "20", totalCarbohydrate: "40", totalFat: "11", transFat: "0")
        
        let encoder = JSONEncoder()
        let encodedFood = try encoder.encode(food)
        XCTAssertNotNil(encodedFood)
        
        let decoder = JSONDecoder()
        let decodedFood = try decoder.decode(Food.self, from: encodedFood)
        XCTAssertEqual(food, decodedFood)
    }
    
    func testFoodHashable() {
        let food1 = Food(allergens: "Eggs", calories: "280", caloriesFromFat: "100", cholestrol: "50", dietaryFiber: "5", ingredients: "Flour, sugar, eggs", name: "Blueberry Muffin", protein: "7", saturatedFat: "2", servingSize: "1 muffin (113g)", sodium: "350", sugars: "20", totalCarbohydrate: "40", totalFat: "11", transFat: "0")
        let food2 = Food(allergens: "Eggs", calories: "280", caloriesFromFat: "100", cholestrol: "50", dietaryFiber: "5", ingredients: "Flour, sugar, eggs", name: "Blueberry Muffin", protein: "7", saturatedFat: "2", servingSize: "1 muffin (113g)", sodium: "350", sugars: "20", totalCarbohydrate: "40", totalFat: "11", transFat: "0")
        
        XCTAssertEqual(food1, food2)
        
        var foodSet = Set<Food>()
        foodSet.insert(food1)
        foodSet.insert(food2)
        XCTAssertEqual(foodSet.count, 1)
    }
    
    func testFoodIdentifiable() {
        let food = Food(allergens: "Eggs", calories: "280", caloriesFromFat: "100", cholestrol: "50", dietaryFiber: "5", ingredients: "Flour, sugar, eggs", name: "Blueberry Muffin", protein: "7", saturatedFat: "2", servingSize: "1 muffin (113g)", sodium: "350", sugars: "20", totalCarbohydrate: "40", totalFat: "11", transFat: "0")
        
        XCTAssertNotNil(food.id)
    }
}


