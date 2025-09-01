//
//  AddFoodView.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

import SwiftUI

struct FoodSelectionView: View {
    @Binding var meal: MealViewModel
    @StateObject var vm: FoodManagementViewModel
    @State private var searchText = ""
    @Binding var toggle: Bool

    var body: some View {
        NavigationStack {
            switch vm.currentLoadingState {
            case .success(let foods):
                VStack {
                    List {
                        ForEach(foods[meal.mealIndex!]) { item in
                            if item.foodName.contains(searchText) {
                                NavigationLink {
                                    FoodDetailView(meal: $meal, vm: vm, togglePopup: $toggle, food: item.self)
                                } label: {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("\(item.foodName)").font(.headline)
                                            .padding(.bottom, 5)

                                        Grid(horizontalSpacing: 20) {
                                            GridRow {
                                                Text("Calories")
                                                        
                                                Text("Protein")
                                                        
                                                Text("Fat")
                                                        
                                                Text("Carbs")
                                            }
                                                    
                                            GridRow {
                                                Text("🔥 \(item.calorieCount.digits)")
                                                if (item.proteinContent.digits.starts(with: "0")) && (item.proteinContent.digits.count > 1) {
                                                    Text("🍗 0.\(item.proteinContent.digits.deletingPrefix("0")) g")
                                                } else {
                                                    Text("🍗 \(item.proteinContent.digits) g")
                                                }
                                                    
                                                Text("🧈 \(item.totalFatContent.digits) g")
                                                        
                                                Text("🍚 \(item.totalCarbohydrateContent.digits) g")
                                            }
                                        }
                                        .font(.subheadline).foregroundColor(.gray)
                                        .padding(.bottom, 10)
                                    }
                                }
                            } else if searchText.isEmpty {
                                NavigationLink {
                                    FoodDetailView(meal: $meal, vm: vm, togglePopup: $toggle, food: item.self)
                                } label: {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("\(item.foodName)").font(.headline)
                                            .padding(.bottom, 5)

                                        Grid(horizontalSpacing: 20) {
                                            GridRow {
                                                Text("Calories")
                                                        
                                                Text("Protein")
                                                        
                                                Text("Fat")
                                                        
                                                Text("Carbs")
                                            }
                                                    
                                            GridRow {
                                                Text("🔥 \(item.calorieCount.digits)")
                                                if (item.proteinContent.digits.starts(with: "0")) && (item.proteinContent.digits.count > 1) {
                                                    Text("🍗 0.\(item.proteinContent.digits.deletingPrefix("0")) g")
                                                } else {
                                                    Text("🍗 \(item.proteinContent.digits) g")
                                                }
                                                    
                                                Text("🧈 \(item.totalFatContent.digits) g")
                                                        
                                                Text("🍚 \(item.totalCarbohydrateContent.digits) g")
                                            }
                                        }
                                        .font(.subheadline).foregroundColor(.gray)
                                            
                                        Text("\(item.allergenInformation)")
                                            .font(.subheadline).foregroundColor(.gray)
                                            .padding(.top, 10)
                                    }
                                }
                            }
                        }
                    }
                }
            case .idle:
                VStack {
                    Text("Currently Loading Food!")
                    ProgressView()
                }
            case .loading:
                VStack {
                    Text("Almost finished Loading!")
                    ProgressView()
                }
            case .error:
                Text("There was an error")
            }
        }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

#Preview {
    FoodSelectionView(meal: ContentView().$breakfast, vm: FoodManagementViewModel(), toggle: MealDetailView(vm: FoodManagementViewModel(), meal: ContentView().$breakfast).$showingPopover)
}
