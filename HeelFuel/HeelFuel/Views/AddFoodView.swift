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
            switch vm.state {
            case .success(let foods):
                VStack {
                    List {
                        ForEach(foods[meal.index!]) { item in
                            if item.name.contains(searchText) {
                                NavigationLink {
                                    FoodDetailView(meal: $meal, vm: vm, togglePopup: $toggle, food: item.self)
                                } label: {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("\(item.name)").font(.headline)
                                            .padding(.bottom, 5)

                                        Grid(horizontalSpacing: 20) {
                                            GridRow {
                                                Text("Calories")
                                                        
                                                Text("Protein")
                                                        
                                                Text("Fat")
                                                        
                                                Text("Carbs")
                                            }
                                                    
                                            GridRow {
                                                Text("🔥 \(item.calories.digits)")
                                                if (item.protein.digits.starts(with: "0")) && (item.protein.digits.count > 1) {
                                                    Text("🍗 0.\(item.protein.digits.deletingPrefix("0")) g")
                                                } else {
                                                    Text("🍗 \(item.protein.digits) g")
                                                }
                                                    
                                                Text("🧈 \(item.totalFat.digits) g")
                                                        
                                                Text("🍚 \(item.totalCarbohydrate.digits) g")
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
                                        Text("\(item.name)").font(.headline)
                                            .padding(.bottom, 5)

                                        Grid(horizontalSpacing: 20) {
                                            GridRow {
                                                Text("Calories")
                                                        
                                                Text("Protein")
                                                        
                                                Text("Fat")
                                                        
                                                Text("Carbs")
                                            }
                                                    
                                            GridRow {
                                                Text("🔥 \(item.calories.digits)")
                                                if (item.protein.digits.starts(with: "0")) && (item.protein.digits.count > 1) {
                                                    Text("🍗 0.\(item.protein.digits.deletingPrefix("0")) g")
                                                } else {
                                                    Text("🍗 \(item.protein.digits) g")
                                                }
                                                    
                                                Text("🧈 \(item.totalFat.digits) g")
                                                        
                                                Text("🍚 \(item.totalCarbohydrate.digits) g")
                                            }
                                        }
                                        .font(.subheadline).foregroundColor(.gray)
                                            
                                        Text("\(item.allergens)")
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
