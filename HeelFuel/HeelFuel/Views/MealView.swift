//
//  MealView.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

import SwiftUI

struct MealDetailView: View {
    @Bindable public var vm: FoodManagementViewModel
    @Binding var meal: MealViewModel
    @State var showingPopover = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(meal.mealEmoji)
                            .font(.largeTitle)
                        Text(meal.mealTimeName)
                            .font(.headline)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        Rectangle()
                            .fill(Color.blue).frame(width: 150, height: 50)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                    )
                    Image("\(meal.mealImageName ?? "")")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .padding(10)
                        .background(.gray.opacity(0.15))
                        .cornerRadius(20)
                        .padding(.horizontal, 10)
                    Spacer()
                    macroSection
                    Divider()
                    ForEach(meal.consumedFoodItems) { item in
                        NavigationLink {
                            FoodDetailView(meal: $meal, vm: vm, togglePopup: $showingPopover, food: item.self)
                        } label: {
                            HStack(spacing: 4) {
                                Text("\(item.foodName)")
                                    .font(.title).foregroundColor(Color.black)

                                Spacer()
                                Text("\(item.calorieCount)")
                                    .font(.title2).foregroundColor(Color.black)

                            }.padding(.all).fontWeight(.bold).background(
                                Rectangle()
                                    .fill(Color.white).cornerRadius(20).shadow(radius: 2)
                            )
                        }
                    }
                    Spacer()
                }.padding(.all)
            }

            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showingPopover.toggle()

                    } label: {
                        ZStack {
                            Rectangle().frame(width: 300, height: 50)
                                .cornerRadius(20).shadow(radius: 3)
                            Text("Add Food")
                                .foregroundColor(Color.white)
                        }
                    }
                }
            }
            .popover(isPresented: $showingPopover) {
                FoodSelectionView(meal: $meal, vm: vm, toggle: $showingPopover)
            }
        }
    }

    var macroSection: some View {
        HStack(spacing: 40) {
            VStack {
                Text(String(meal.totalCaloriesConsumed))
                Text("Calories")
            }.foregroundColor(Color.black)
            VStack {
                Text(String(meal.totalCarbsConsumed))
                Text("Carbs")
            }.foregroundColor(Color.black)
            VStack {
                Text(String(meal.totalProteinConsumed))
                Text("Protein")
            }.foregroundColor(Color.black)
            VStack {
                Text(String(meal.totalFatConsumed))
                Text("Fat")
            }.foregroundColor(Color.black)
        }.padding(.all).fontWeight(.bold).background(
            Rectangle().fill(Color.white).cornerRadius(20).shadow(radius: 2)
        )
    }
}

#Preview {
    MealDetailView(vm: FoodManagementViewModel(), meal: ContentView().$breakfast)
}
