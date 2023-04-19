//
//  HomeView.swift
//  HeelFuel
//
//  Created by Milan Dutta on 4/14/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = AddFoodViewModel()
    @State var breakfast = MealModel(mealTime: "Breakfast", emoji: "🍳", image: "breakfast", index: 0, caloriesEaten: 0, carbsEaten: 0, fatEaten: 0, proteinEaten: 0, mealList: [])
    @State var lunch = MealModel(mealTime: "Lunch", emoji: "🍱",  image: "lunch", index: 1, caloriesEaten: 0, carbsEaten: 0, fatEaten: 0, proteinEaten: 0, mealList: [])
    @State var dinner = MealModel(mealTime: "Dinner", emoji: "🍽️",  image: "dinner", index: 3, caloriesEaten: 0, carbsEaten: 0, fatEaten: 0, proteinEaten: 0, mealList: [])
    @State var snack = MealModel(mealTime: "Snack", emoji: "🍎", image: "snack", caloriesEaten: 0, carbsEaten: 0, fatEaten: 0, proteinEaten: 0, mealList: [])
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Daily Macros").fontDesign(.default).font(.title).padding(.all)
                RingView()
                    .environmentObject(CDDataModel())
                
                Divider()
                
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
                    NavigationLink {
                        MealView(vm: vm, meal: $snack)} label: {                       MealSectionView(icon: "🍎", mealTime: "Snack", calories: String(snack.caloriesEaten))
                            .foregroundColor(.black)
                    }
                    
                    
                }
                .cornerRadius(20)
                .shadow(radius: 2)
                .padding(.top,30)
                .padding(.horizontal,10)
                Spacer()
                
                
            }
            
        }.onAppear(){
            vm.findFoods()
            print(vm.foodList.indices)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
