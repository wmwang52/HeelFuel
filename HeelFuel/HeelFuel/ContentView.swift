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
    
    @State var maxHeight: CGFloat = UIScreen.main.bounds.height / 5
    @State var sliderProgress: CGFloat = 0
    @State var sliderHeight: CGFloat = 0
    @State var lastDragValue: CGFloat = 0

    @State var breakfast = UserDefaults.standard.object(forKey: "Breakfast") as? MealModel ?? MealModel(mealTime: "Breakfast", emoji: "🍳", image: "breakfast", index: 0, caloriesEaten: 0, carbsEaten: 0, fatEaten: 0, proteinEaten: 0, mealList: [])
    @State var lunch = UserDefaults.standard.object(forKey: "Lunch") as? MealModel ?? MealModel(mealTime: "Lunch", emoji: "🍱", image: "lunch", index: 1, caloriesEaten: 0, carbsEaten: 0, fatEaten: 0, proteinEaten: 0, mealList: [])
    @State var dinner = UserDefaults.standard.object(forKey: "Dinner") as? MealModel ?? MealModel(mealTime: "Dinner", emoji: "🍽️", image: "dinner", index: 3, caloriesEaten: 0, carbsEaten: 0, fatEaten: 0, proteinEaten: 0, mealList: [])

    var body: some View {
        NavigationSplitView {
            VStack {
                HStack {}
                RingView()
                    .environmentObject(AddFoodViewModel())
                
                Divider()
                    .padding(.vertical, 5)
                
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
                    
                    NavigationLink {} label: {
                        MealSectionView(icon: "💡", mealTime: "Recommendations", calories: "")
                            .foregroundColor(.black)
                    }
                }
                .cornerRadius(20)
                .shadow(radius: 2)
                .padding(.horizontal, 10)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        .padding(.horizontal, 10)

                        .shadow(radius: 2)
                        
                        .padding(.vertical, 5)
                }
                
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
