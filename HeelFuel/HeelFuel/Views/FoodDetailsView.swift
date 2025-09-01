//
//  FoodDetailsView.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

import SwiftUI

struct FoodDetailView: View {
    @Binding var meal: MealViewModel
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: FoodManagementViewModel
    @Binding var togglePopup: Bool

    let food: FoodModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Macronutrients(food: food)
                        .frame(width: UIScreen.main.bounds.width)

                    KeyInfo
                    Divider()
                    Text("Nutrients:")
                        .font(.title)
                        .padding(.leading)

                    nutrients
                    Divider()

                    Text("\(food.ingredientList)").fontWeight(.light).padding(.horizontal)
                    Spacer()
                }
                .padding()
                .navigationTitle("\(food.foodName)")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            togglePopup.toggle()
                            meal.totalCaloriesConsumed += Int(food.calorieCount.digits)!
                            meal.totalProteinConsumed += Int(food.proteinContent.digits)!
                            meal.totalFatConsumed += Int(food.totalFatContent.digits)!
                            meal.totalCarbsConsumed += Int(food.totalCarbohydrateContent.digits)!
                            meal.consumedFoodItems.append(food)
                            //                        UserDefaults.standard.set(meal, forKey: meal.mealTime)
                            // Pass in a meal to each
                            vm.addFoodNutritionalValues(foodItem: food)
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
    }

    var KeyInfo: some View {
        Group {
            Text("\(food.allergenInformation)")
            Text("\(food.servingSizeDescription)")
        }
        .padding(.leading).font(.title3)
    }

    var nutrients: some View {
        Group {
            Text("\(food.transFatContent)")
            Text("\(food.saturatedFatContent)")
            Text("\(food.cholesterolContent)")
            Text("\(food.sodiumContent)")
            Text("\(food.dietaryFiberContent)")
            Text("\(food.sugarContent)")
        }
        .font(.title3)
        .padding(.leading)
    }
}

extension String {
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }

    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }

    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
}

struct Macronutrients: View {
    var food: FoodModel

    var body: some View {
        VStack {
            Grid(horizontalSpacing: 20) { Grid(horizontalSpacing: 20) {
                GridRow {
                    Text("Calories")

                    Text("Protein")

                    Text("Fat")

                    Text("Carbs")
                }

                GridRow {
                    Text("🔥 \(food.calorieCount.digits)")
                    if (food.proteinContent.digits.starts(with: "0")) && (food.proteinContent.digits.count > 1) {
                        Text("🍗 0.\(food.proteinContent.digits.deletingPrefix("0")) g")
                    } else {
                        Text("🍗 \(food.proteinContent.digits) g")
                    }

                    Text("🧈 \(food.totalFatContent.digits) g")

                    Text("🍚 \(food.totalCarbohydrateContent.digits) g")
                }
                .foregroundColor(.gray)
            }
            .font(.title3)
            .padding(.vertical, 10)
            }
        }
    }
}

#Preview {
    let sampleFood = FoodModel(id: UUID(), allergenInformation: "Fish", calorieCount: "130", caloriesFromFatContent: "90 calories", cholesterolContent: "300", dietaryFiberContent: "0", ingredientList: "Salmon, Atlantic Filet (Atlantic Salmon, Canthaxanthin Color, Astaxanthin Color), Oil Vegetable Blend w/ Pure Olive Oil (Vegetable Oil [may contain one or more of the following: soybean, canola, corn, sunflower oil], Pure Olive Oil, Beta Carotene)", foodName: "Seared Salmon", proteinContent: "10", saturatedFatContent: "2", servingSizeDescription: "2 oz", sodiumContent: "30", sugarContent: "0", totalCarbohydrateContent: "0", totalFatContent: "10", transFatContent: "10")

    FoodDetailView(meal: ContentView().$breakfast, vm: FoodManagementViewModel(), togglePopup: FoodSelectionView(meal: ContentView().$breakfast, vm: FoodManagementViewModel(), toggle: MealDetailView(vm: FoodManagementViewModel(), meal: ContentView().$breakfast).$showingPopover).$toggle, food: sampleFood)
}
