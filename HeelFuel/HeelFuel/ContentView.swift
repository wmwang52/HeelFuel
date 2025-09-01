//
//  ContentView.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]

    @StateObject var vm = AddFoodViewModel()

    @State var breakfast = MealModel(mealTime: "Breakfast", emoji: "🍳", image: "breakfast", index: 0, caloriesEaten: 0, carbsEaten: 0, fatEaten: 0, proteinEaten: 0, mealList: [])
    @State var lunch = MealModel(mealTime: "Lunch", emoji: "🍱", image: "lunch", index: 1, caloriesEaten: 0, carbsEaten: 0, fatEaten: 0, proteinEaten: 0, mealList: [])
    @State var dinner = MealModel(mealTime: "Dinner", emoji: "🍽️", image: "dinner", index: 3, caloriesEaten: 0, carbsEaten: 0, fatEaten: 0, proteinEaten: 0, mealList: [])

    var body: some View {
        NavigationSplitView {
            VStack {
                VStack(spacing: 0) {
                    NavigationLink {
                        MealView(vm: vm, meal: $breakfast)
                    } label: {
                        MealSectionView(icon: "🍳", mealTime: "Breakfast", calories: String(breakfast
                                .caloriesEaten))
                            .foregroundColor(.black)
                    }
                    Divider()

                    NavigationLink {
                        MealView(vm: vm, meal: $lunch)
                    } label: {
                        MealSectionView(icon: "🍱", mealTime: "Lunch", calories: String(lunch.caloriesEaten))
                            .foregroundColor(.black)
                    }
                    Divider()

                    NavigationLink {
                        MealView(vm: vm, meal: $dinner)
                    } label: {
                        MealSectionView(icon: "🍽️", mealTime: "Dinner", calories: String(dinner.caloriesEaten))
                            .foregroundColor(.black)
                    }
                    Divider()
                }
                .cornerRadius(20)
                .shadow(radius: 2)
                .padding(.horizontal, 10)

                Spacer()
            }
        } detail: {
            Text("Select an item")
        }.onAppear {
            vm.resetDefaults()
            vm.findFoods()
            print(vm.foodList.indices)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
