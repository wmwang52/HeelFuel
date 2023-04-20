
//  FoodDetailsView.swift
//  food4thought
//
//  Created by Mitchell Anderson on 4/11/23.

import SwiftUI

struct FoodDetailView: View {
    @Binding var meal: MealModel
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: AddFoodViewModel

    
    let food: Food

    var body: some View {

        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                KeyInfo
                Divider().padding(.bottom)
                Text("Macronutrients:")
                    .font(.headline)
                    .padding(.leading)
                macros
                nutrients
                Divider()
                Text("Ingredients: \(food.ingredients)").fontWeight(.light).padding(.leading)
            }
            .padding()
            .navigationTitle("Food Details")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        meal.caloriesEaten += Int(food.calories.digits)!
                        meal.proteinEaten += Int(food.protein.digits)!
                        meal.fatEaten += Int(food.totalFat.digits)!
                        meal.carbsEaten += Int(food.totalCarbohydrate.digits)!
                        meal.mealList.append(food)
//                        UserDefaults.standard.set(meal, forKey: meal.mealTime)
                        // Pass in a meal to each
                        vm.addFoodValues(food: food)
//                        vm.addFoodValues(food: food, meal: meal)
//                        UserDefaults.standard.set(meal, forKey: meal.mealTime)
                        dismiss()
                        
                    } label: {
                        Text("Add Food")
                    }
                }
            }
        }
    }

    var KeyInfo: some View {
        Group {
            Text(food.name)
                .font(.title)

                Text("\(food.allergens)")
                Text("\(food.servingSize)")
                Text("\(food.calories)")
        }
        .fontWeight(.bold).padding(.leading)
    }

    var macros: some View {
        Group {
            Text("\(food.caloriesFromFat)")
            Text("\(food.totalFat)")
            Text("\(food.saturatedFat)")
            Text("\(food.totalCarbohydrate)")
            Text("\(food.protein)")
        }
        .fontWeight(.medium)
        .padding(.leading)
    }
    var nutrients: some View {
        Group {
            Text("\(food.transFat)")
            Text("\(food.saturatedFat)")
            Text("\(food.cholestrol)")
            Text("\(food.sodium)")
            Text("\(food.dietaryFiber)")
            Text("\(food.sugars)")
        }
        .fontWeight(.medium).padding(.leading)
    }
}


struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleFood = Food(id: UUID(), allergens: "Fish", calories: "130", caloriesFromFat: "90", cholestrol: "30", dietaryFiber: "0", ingredients: "Salmon, Atlantic Filet (Atlantic Salmon, Canthaxanthin Color, Astaxanthin Color), Oil Vegetable Blend w/ Pure Olive Oil (Vegetable Oil [may contain one or more of the following: soybean, canola, corn, sunflower oil], Pure Olive Oil, Beta Carotene)" , name: "Seared Salmon", protein: "10", saturatedFat: "2", servingSize: "2 oz", sodium: "30", sugars: "0", totalCarbohydrate: "0", totalFat: "10", transFat: "10")
        
        FoodDetailView(meal: HomeView().$breakfast, vm: AddFoodViewModel(), food: sampleFood)
    }
}

extension String {
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
}
