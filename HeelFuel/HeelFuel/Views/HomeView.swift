//
//  HomeView.swift
//  HeelFuel
//

//MARK: View that is shown when the user opens the app

import SwiftUI

struct HomeView: View {
    @StateObject var vm = AddFoodViewModel()
    
    @State var maxHeight: CGFloat = UIScreen.main.bounds.height / 5
    @State var sliderProgress: CGFloat = 0
    @State var sliderHeight: CGFloat = 0
    @State var lastDragValue: CGFloat = 0

    @State var breakfast = UserDefaults.standard.object(forKey: "Breakfast") as? MealModel ?? MealModel(mealTime: "Breakfast", emoji: "🍳", image: "breakfast", index: 0, caloriesEaten: 0, carbsEaten: 0, fatEaten: 0, proteinEaten: 0, mealList: [])
    @State var lunch = UserDefaults.standard.object(forKey: "Lunch") as? MealModel ?? MealModel(mealTime: "Lunch", emoji: "🍱", image: "lunch", index: 1, caloriesEaten: 0, carbsEaten: 0, fatEaten: 0, proteinEaten: 0, mealList: [])
    @State var dinner = UserDefaults.standard.object(forKey: "Dinner") as? MealModel ?? MealModel(mealTime: "Dinner", emoji: "🍽️", image: "dinner", index: 3, caloriesEaten: 0, carbsEaten: 0, fatEaten: 0, proteinEaten: 0, mealList: [])

    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    
                   
                }
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
                    
                    NavigationLink {
                    } label: {
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

        }.onAppear {
            vm.resetDefaults()
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
