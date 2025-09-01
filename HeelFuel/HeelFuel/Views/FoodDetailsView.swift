//
//  FoodDetailsView.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

import SwiftUI

struct FoodDetailView: View {
    @Binding var meal: MealModel
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: AddFoodViewModel
    @Binding var togglePopup: Bool

    let food: Food

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

                    Text("\(food.ingredients)").fontWeight(.light).padding(.horizontal)
                    Spacer()
                }
                .padding()
                .navigationTitle("\(food.name)")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            togglePopup.toggle()
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
    }

    var KeyInfo: some View {
        Group {
            Text("\(food.allergens)")
            Text("\(food.servingSize)")
        }
        .padding(.leading).font(.title3)
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
    var food: Food

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
                    Text("🔥 \(food.calories.digits)")
                    if (food.protein.digits.starts(with: "0")) && (food.protein.digits.count > 1) {
                        Text("🍗 0.\(food.protein.digits.deletingPrefix("0")) g")
                    } else {
                        Text("🍗 \(food.protein.digits) g")
                    }

                    Text("🧈 \(food.totalFat.digits) g")

                    Text("🍚 \(food.totalCarbohydrate.digits) g")
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
    let sampleFood = Food(id: UUID(), allergens: "Fish", calories: "130", caloriesFromFat: "90 calories", cholestrol: "300", dietaryFiber: "0", ingredients: "Salmon, Atlantic Filet (Atlantic Salmon, Canthaxanthin Color, Astaxanthin Color), Oil Vegetable Blend w/ Pure Olive Oil (Vegetable Oil [may contain one or more of the following: soybean, canola, corn, sunflower oil], Pure Olive Oil, Beta Carotene)", name: "Seared Salmon", protein: "10", saturatedFat: "2", servingSize: "2 oz", sodium: "30", sugars: "0", totalCarbohydrate: "0", totalFat: "10", transFat: "10")

    FoodDetailView(meal: ContentView().$breakfast, vm: AddFoodViewModel(), togglePopup: AddFoodView(meal: ContentView().$breakfast, vm: AddFoodViewModel(), toggle: MealView(vm: AddFoodViewModel(), meal: ContentView().$breakfast).$showingPopover).$toggle, food: sampleFood)
}
