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
//    @Query private var items: [ItemModel]

    @State var vm = FoodManagementViewModel()

    @State var breakfast = MealViewModel(mealTimeName: "Breakfast", mealEmoji: "🍳", mealImageName: "breakfast", mealIndex: 0, totalCaloriesConsumed: 0, totalCarbsConsumed: 0, totalFatConsumed: 0, totalProteinConsumed: 0, consumedFoodItems: [])
    @State var lunch = MealViewModel(mealTimeName: "Lunch", mealEmoji: "🍱", mealImageName: "lunch", mealIndex: 1, totalCaloriesConsumed: 0, totalCarbsConsumed: 0, totalFatConsumed: 0, totalProteinConsumed: 0, consumedFoodItems: [])
    @State var dinner = MealViewModel(mealTimeName: "Dinner", mealEmoji: "🍽️", mealImageName: "dinner", mealIndex: 3, totalCaloriesConsumed: 0, totalCarbsConsumed: 0, totalFatConsumed: 0, totalProteinConsumed: 0, consumedFoodItems: [])

    var body: some View {
        NavigationSplitView {
            VStack {
                VStack(spacing: 0) {
                    NavigationLink {
                        MealDetailView(vm: vm, meal: $breakfast)
                    } label: {
                        MealSectionView(icon: "🍳", mealTime: "Breakfast", calories: String(breakfast
                                .totalCaloriesConsumed))
                            .foregroundColor(.black)
                    }
                    Divider()

                    NavigationLink {
                        MealDetailView(vm: vm, meal: $lunch)
                    } label: {
                        MealSectionView(icon: "🍱", mealTime: "Lunch", calories: String(lunch.totalCaloriesConsumed))
                            .foregroundColor(.black)
                    }
                    Divider()

                    NavigationLink {
                        MealDetailView(vm: vm, meal: $dinner)
                    } label: {
                        MealSectionView(icon: "🍽️", mealTime: "Dinner", calories: String(dinner.totalCaloriesConsumed))
                            .foregroundColor(.black)
                    }
                    Divider()
                }
                .cornerRadius(20)
                .shadow(radius: 1)
                .padding(.horizontal, 10)
            }
        } detail: {
            Text("Choose a Category")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ItemModel.self, inMemory: true)
}
