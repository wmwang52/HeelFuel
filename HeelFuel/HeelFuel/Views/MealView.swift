//
//  MealView.swift
//  food4thought
//
//  Created by Mitchell Anderson on 4/12/23.
//

import Foundation
import SwiftUI

struct MealView: View {
    @StateObject public var vm: AddFoodViewModel
    @Binding var meal: MealModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text(meal.emoji)
                            .font(.largeTitle)
                        Text(meal.mealTime)
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
                    Image("\(meal.image ?? "")")
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
                  
 
                        
                
                    
                        ForEach(meal.mealList) { item in
                            NavigationLink {
                                FoodDetailView(meal: $meal, vm: vm, food: item.self)
                            } label: {
                                HStack(spacing: 4) {
                                    Text("\(item.name)")
                                        .font(.title).foregroundColor(Color.black)

                                    
                                    Spacer()
                                    Text("\(item.calories)")
                                        .font(.title2).foregroundColor(Color.black)

                                }.padding(.all).fontWeight(.bold).background(
                                    Rectangle().fill(Color.white).cornerRadius(20).shadow(radius: 2)
                                )
                            }
                    }
                    Spacer()
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink {
                        AddFoodView(meal: $meal, vm: vm)
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
        }
    }
    
    var macroSection: some View {
        HStack {
            VStack {
                Text(String(meal.caloriesEaten))
                Text("Calories")
            }.foregroundColor(Color.black)
            VStack {
                Text(String(meal.carbsEaten))
                Text("Carbohydrates")
            }.foregroundColor(Color.black)
            VStack {
                Text(String(meal.proteinEaten))
                Text("Protein")
            }.foregroundColor(Color.black)
            VStack {
                Text(String(meal.fatEaten))
                Text("Fat")
            }.foregroundColor(Color.black)
        }.padding(.all).fontWeight(.bold).background(
            Rectangle().fill(Color.white).cornerRadius(20).shadow(radius: 3)
        )
    }
}

struct MealViewPreview: PreviewProvider {
    static var previews: some View {
        MealView(vm: AddFoodViewModel(), meal: HomeView().$breakfast)
    }
}
